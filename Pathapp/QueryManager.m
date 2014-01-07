//
//  QueryManager.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "QueryManager.h"
#import "DataStore.h"
#import "Stops+Methods.h"
#import "StopTimes+Methods.h"

@interface QueryManager ()
@property (strong, nonatomic) NSArray *stopsArray;
@property (strong, nonatomic) NSArray *fetchedStoptimesArray;
@end

@implementation QueryManager

+(QueryManager*)sharedQueryManager {
    static QueryManager *sharedQueryManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedQueryManager = [[self alloc] init];
    });
    return sharedQueryManager;
}

-(NSArray*)getStopsFromSavedStops{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Stops" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedStopsArray = [[DataStore sharedStore].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return fetchedStopsArray;
}

-(NSNumber*)getStopIDForStation:(NSString*)Station{
    self.stopsArray = [self getStopsFromSavedStops];
    NSNumber *stopID;
    for (Stops *stop in self.stopsArray){
        if ([stop.stopName isEqualToString:Station]){
            stopID = stop.stopID;
            break;
        }
    }
    return  stopID;
}

-(NSString*)getStopNameForStopID:(NSNumber*)stopID{
    NSString *stopName;
    self.stopsArray = [self getStopsFromSavedStops];
    for (Stops *stop in self.stopsArray){
        if ([stop.stopID isEqualToNumber:stopID]){
            stopName = stop.stopName;
            break;
        }
    }
    return stopName;
}

-(void)fetchStopTimesForTripID:(NSString*)tripID withCompletionBlock:(void (^)(NSArray *array))block{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StopTimes" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tripID ==%@", tripID];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *array = [[DataStore sharedStore].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    block(array);
}

-(void)fetchStopTimesForStopID:(NSNumber*)stopID andStopTime:(NSString*)stopTime withCompletionBlock:(void (^)(NSArray *array))block{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StopTimes" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"stopID == %@ && arrivalTime > %@", stopID, stopTime];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    self.fetchedStoptimesArray = [[DataStore sharedStore].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    NSLog(@"fetchedStopTimesArray first object stop ID %@", ((StopTimes*)[_fetchedStoptimesArray firstObject]).stopID);
    NSLog(@"fetchedStopTimesArray count %d", [self.fetchedStoptimesArray count]);
    block(self.fetchedStoptimesArray);
}

-(NSArray*)getTripsForArrivalstopID:(NSNumber*)arrivalStopID andTime:(NSString*)time andDate:(NSString*)date{
    NSLog(@"get trips for arrival ID called");
    NSMutableArray *tripsArray = [[NSMutableArray alloc]init];
        [self fetchStopTimesForStopID:arrivalStopID andStopTime:time withCompletionBlock:^(NSArray *array) {
            NSDate *tripDate = [[NSDate alloc]init];
            tripDate = [self createDateFromTimeString:time andTripDateString:date];
            //NSLog(@"tripDate %@", tripDate);
        for (StopTimes *stoptime in array){
            NSString *timeString =stoptime.arrivalTime;
            NSDate *trainTripDate = [[NSDate alloc]init];
            trainTripDate = [self createDateFromTimeString:timeString andTripDateString:date];
            NSTimeInterval difference = [trainTripDate timeIntervalSinceDate:tripDate];
            NSNumber *timeDifference = [NSNumber numberWithDouble:difference];
            NSDictionary *trips = [[NSDictionary alloc]initWithObjects:@[stoptime.stop_sequence, stoptime.tripID, stoptime.arrivalTime, timeDifference] forKeys:@[@"stopSequence", @"tripID", @"arrivalTime", @"timeDifference"]];
            [tripsArray addObject:trips];
        }
    }];
    //NSLog(@"tripsArray %@", [tripsArray description]);
    return tripsArray;
}

-(NSDate*)createDateFromTimeString:(NSString*)timeString andTripDateString:(NSString*)tripDateString{
    NSString *dateString = [tripDateString stringByAppendingString:[NSString stringWithFormat:@" %@",timeString]];
    //NSLog(@"date string %@", dateString);
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM/dd/yy HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

-(StopTimes*)getStopTimeForTripID:(NSString*)tripID andStopSequence:(NSNumber*)stopSequence{
    for (StopTimes *stopTime in self.fetchedStoptimesArray){
        if (([stopTime.stop_sequence integerValue] == [stopSequence integerValue]-1) && [stopTime.tripID isEqualToString:tripID]){
            return stopTime;
        }
    }
    return nil;
}

-(void)getTripsForDepartureStation:(NSString*)departureStation andArrivalStation:(NSString*) arrivalStation andDepartAtTime:(NSString*) departTime andArriveByTime:(NSString*)ArriveTime andDate:(NSString*)date{
    //NSMutableArray *routes = [[NSMutableArray alloc] init];
    //NSNumber *departureStopID = [self getStopIDForStation:departureStation];
    NSNumber *arrivalStopID = [self getStopIDForStation:arrivalStation];
    NSLog(@"arrival stopId %@", arrivalStopID);
    NSArray *tripsArray = [self getTripsForArrivalstopID:arrivalStopID andTime:departTime andDate:date];
    NSLog(@"trips array count %d", [tripsArray count]);
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"timeDifference" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray  =[tripsArray sortedArrayUsingDescriptors:descriptors];
    NSLog(@"sorted array %@", [sortedArray description]);
    NSMutableArray *validTripsArray = [[NSMutableArray alloc]init];
    for (int i=0; i<10; i++){
        NSInteger timeDifference = [[sortedArray[i] objectForKey:@"timeDifference"] integerValue];
        if ((timeDifference !=0) && (timeDifference<7200)){
            [validTripsArray addObject:sortedArray[i]];
        }
        for (NSDictionary *trip in validTripsArray){
            [self fetchStopTimesForTripID:[trip objectForKey:@"tripID"] withCompletionBlock:^(NSArray *array) {
            }];
        }
    }
}

@end
