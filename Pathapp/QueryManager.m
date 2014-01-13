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
@property (strong, nonatomic) NSMutableArray *tripResults;
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
    NSLog(@"fetchedStopTimesArray first object stop ID %@", ((StopTimes*)[self.fetchedStoptimesArray firstObject]).stopID);
    NSLog(@"fetchedStopTimesArray count %d", [self.fetchedStoptimesArray count]);
    block(self.fetchedStoptimesArray);
}

-(NSArray*)fetchStoptimesForTripID:(NSString*)tripID{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StopTimes" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tripID ==%@", tripID];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *array = [[DataStore sharedStore].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return array;
}

-(NSArray*)getTripsForArrivalstopID:(NSNumber*)arrivalStopID andTime:(NSString*)time andDate:(NSString*)date{
    NSLog(@"get trips for arrival ID called");
    NSMutableArray *tripsArray = [[NSMutableArray alloc]init];
        [self fetchStopTimesForStopID:arrivalStopID andStopTime:time withCompletionBlock:^(NSArray *array) {
            NSDate *tripDate = [[NSDate alloc]init];
            tripDate = [self createDateFromTimeString:time andTripDateString:date];
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

-(NSArray*)getStopTimeForTripID:(NSString*)tripID andStopSequence:(NSNumber*)stopSequence{
    NSLog(@"get stoptimes for tripid and stopsequence called");
    NSLog(@"tripID %@", tripID);
    NSLog(@"stopsequence %@", stopSequence);
    NSArray *array = [self fetchStoptimesForTripID:tripID];
    NSMutableArray *validStoptimesArray = [[NSMutableArray alloc]init];
    NSNumber *givenStopSequence =[NSNumber numberWithInteger:[stopSequence integerValue]-1];
    NSNumber *givenStopSequence1 = [NSNumber numberWithInteger:[stopSequence integerValue]+1];
    for (StopTimes *stopTime in array){
        if ([stopSequence isEqualToNumber:@1]){
            break;
        } else if ([tripID isEqualToString:stopTime.tripID] && [givenStopSequence isEqualToNumber:stopTime.stop_sequence]){
            NSLog(@"1 stoptime less %@", stopTime);
            [validStoptimesArray addObject:stopTime];
        } else if ([tripID isEqualToString:stopTime.tripID] && [givenStopSequence1 isEqualToNumber:stopTime.stop_sequence]){
            //NSLog(@"1 stoptime more %@", stopTime);
            //[validStoptimesArray addObject:stopTime];
        }
    }
    return array;
}

-(NSString*)getDayFromDate:(NSDate*)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *day= [dateFormatter stringFromDate:date];
    NSLog(@"day is %@", day);
    return day;
}

-(NSArray*)getTripsForDepartureStation:(NSString*)departureStation andArrivalStation:(NSString*) arrivalStation andDepartAtTime:(NSString*) departTime andArriveByTime:(NSString*)ArriveTime andDate:(NSString*)date{
    self.tripResults = [[NSMutableArray alloc]init];
    NSNumber *arrivalStopID = [self getStopIDForStation:arrivalStation];
    NSNumber *departureStopID = [self getStopIDForStation:departureStation];
    NSLog(@"arrival stopId %@", arrivalStopID);
    NSLog(@"departure stopId %@", departureStopID);
    NSArray *tripsArray = [self getTripsForArrivalstopID:arrivalStopID andTime:departTime andDate:date];
    NSLog(@"trips array count %d", [tripsArray count]);
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"timeDifference" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray  =[tripsArray sortedArrayUsingDescriptors:descriptors];
    NSMutableArray *validTripsArray = [[NSMutableArray alloc]init];
    for (int i=0; i<20; i++){
        NSInteger timeDifference = [[sortedArray[i] objectForKey:@"timeDifference"] integerValue];
        if ((timeDifference !=0) && (timeDifference<7200)){
            [validTripsArray addObject:sortedArray[i]];
        }
    }
    NSLog(@"valid trips array count %d", [validTripsArray count]);
    for (NSDictionary *trip in validTripsArray){
        if ([[trip objectForKey:@"stopSequence"] isEqualToNumber:@1] || [[trip objectForKey:@"stopSequence"] isEqualToNumber:@6]){
        } else {
            NSArray *array= [self getStopTimeForTripID:[trip objectForKey:@"tripID"] andStopSequence:[trip objectForKey:@"stopSequence"]];
            for (StopTimes *stoptime in array){
                if ([stoptime.stopID isEqualToNumber:departureStopID]){
                    [self.tripResults addObject:trip];
                } else {
                    [self getTripsForDepartureStation:departureStation andArrivalStation:[self getStopNameForStopID:stoptime.stopID] andDepartAtTime:departTime  andArriveByTime:departTime andDate:date];
                }
            }
        }
    }
    NSLog(@"valid trips array %@", [validTripsArray description]);
    NSLog(@"result array count:%d", [self.tripResults count]);
    NSLog(@"result array first object:%@", [self.tripResults firstObject]);
    return self.tripResults;
}

@end
