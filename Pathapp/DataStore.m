//
//  DataStore.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "DataStore.h"
#import "Stops+Methods.h"
#import "Routes+Methods.h"
#import "Trips+Methods.h"
#import "StopTimes+Methods.h"
#import "WeekService+Methods.h"

NSString *baseFilepath = @"/Users/swampy/Desktop/PATH/Pathapp/json";

@implementation DataStore

@synthesize managedObjectContext = _managedObjectContext;

@synthesize  managedObjectModel = _managedObjectModel;

@synthesize persistentStoreCoordinator =_persistentStoreCoordinator;

@synthesize stopsFetchedResultsController =_stopsFetchedResultsController;

@synthesize routesFetchedResultsController =_routesFetchedResultsController;

@synthesize tripsFetchedResultsController =_tripsFetchedResultsController;

@synthesize stopTimesFetchedResultsController =_stopTimesFetchedResultsController;

@synthesize weekServiceFetchedResultsController =_weekServiceFetchedResultsController;


+(DataStore*)sharedStore {
    
    static DataStore *sharedStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] init];
    });
    return sharedStore;
}

#pragma mark -FetchedResultsController

- (NSFetchedResultsController *) stopsFetchedResultsController {
    if (_stopsFetchedResultsController != nil) {
        return _stopsFetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Stops" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"stopName" ascending:NO];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSFetchedResultsController *myFetchedResultsController =
    [[NSFetchedResultsController alloc]
     initWithFetchRequest:fetchRequest
     managedObjectContext:self.managedObjectContext
     sectionNameKeyPath:nil
     cacheName:@"Stops"];
    
    _stopsFetchedResultsController = myFetchedResultsController;
    
    [_stopsFetchedResultsController performFetch:nil];
    
    return _stopsFetchedResultsController;
}

- (NSFetchedResultsController *) tripsFetchedResultsController {
    if (_tripsFetchedResultsController != nil) {
        return _tripsFetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Trips" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    [fetchRequest setFetchBatchSize:20];
    
     NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"tripID" ascending:NO];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSFetchedResultsController *myFetchedResultsController =
    [[NSFetchedResultsController alloc]
     initWithFetchRequest:fetchRequest
     managedObjectContext:self.managedObjectContext
     sectionNameKeyPath:nil
     cacheName:@"Trips"];
    
    _tripsFetchedResultsController = myFetchedResultsController;
    
    [_tripsFetchedResultsController performFetch:nil];
    
    return _tripsFetchedResultsController;
}

- (NSFetchedResultsController *) routesFetchedResultsController {
    if (_routesFetchedResultsController != nil) {
        return _routesFetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Routes" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:20];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"routeID" ascending:NO];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    NSFetchedResultsController *myFetchedResultsController =
    [[NSFetchedResultsController alloc]
     initWithFetchRequest:fetchRequest
     managedObjectContext:self.managedObjectContext
     sectionNameKeyPath:nil
     cacheName:@"Routes"];
    
    _routesFetchedResultsController = myFetchedResultsController;
    
    [_routesFetchedResultsController performFetch:nil];
    
    return _routesFetchedResultsController;
}

- (NSFetchedResultsController *) stopTimesFetchedResultsController {
    if (_stopTimesFetchedResultsController != nil) {
        return _stopTimesFetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StopTimes" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"stopID" ascending:NO];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSFetchedResultsController *myFetchedResultsController =
    [[NSFetchedResultsController alloc]
     initWithFetchRequest:fetchRequest
     managedObjectContext:self.managedObjectContext
     sectionNameKeyPath:nil
     cacheName:@"StopTimes"];
    
    _stopTimesFetchedResultsController = myFetchedResultsController;
    
    [_stopTimesFetchedResultsController performFetch:nil];
    
    return _stopTimesFetchedResultsController;
}

- (NSFetchedResultsController *) weekServiceFetchedResultsController {
    if (_weekServiceFetchedResultsController != nil) {
        return _weekServiceFetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WeekService" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"serviceID" ascending:NO];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSFetchedResultsController *myFetchedResultsController =
    [[NSFetchedResultsController alloc]
     initWithFetchRequest:fetchRequest
     managedObjectContext:self.managedObjectContext
     sectionNameKeyPath:nil
     cacheName:@"WeekService"];
    
    _weekServiceFetchedResultsController = myFetchedResultsController;
    
    [_weekServiceFetchedResultsController performFetch:nil];
    
    return _weekServiceFetchedResultsController;
}


#pragma mark - Core Data stack

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark-reading JSON

//-(void)jsonParser {
//    
//    NSLog(@"jsonparser called");
//    SBJson4Parser *parser = [[SBJson4Parser alloc]init];
//    NSString *baseFilepath = @"/Users/swampy/Desktop/PATH/Pathapp/json";
//    //NSString *baseFilepath = @"/json";
//    NSString *routesPath = [NSString stringWithFormat:@"%@/routes.json", baseFilepath];
//    NSString *stopsPath = [NSString stringWithFormat:@"%@/stops.json", baseFilepath];
//    NSString *tripsPath = [NSString stringWithFormat:@"%@/trips.json", baseFilepath];
//    NSString *stopTimesPath = [NSString stringWithFormat:@"%@/stop_times.json", baseFilepath];
//    NSString *weekServicePath = [NSString stringWithFormat:@"%@/calendar.json", baseFilepath];
//    //NSData *data = [NSData dataWithContentsOfFile:path];
//    NSString *routesJsonString = [[NSString alloc] initWithContentsOfFile:routesPath encoding:NSUTF8StringEncoding error:nil];
//    NSString *stopsJsonString = [[NSString alloc] initWithContentsOfFile:stopsPath encoding:NSUTF8StringEncoding error:nil];
//    NSString *tripsJsonString = [[NSString alloc] initWithContentsOfFile:tripsPath encoding:NSUTF8StringEncoding error:nil];
//    NSString *stopTimesJsonString = [[NSString alloc] initWithContentsOfFile:stopTimesPath encoding:NSUTF8StringEncoding error:nil];
//    NSString *weekserviceJsonString = [[NSString alloc] initWithContentsOfFile:weekServicePath encoding:NSUTF8StringEncoding error:nil];
//    NSArray *routeObjects = [parser objectWithString:routesJsonString];
//    if ([self.routesFetchedResultsController.fetchedObjects count] ==0) {
//        for (NSDictionary *object in routeObjects){
//            NSString *routeIDstring = object[@"route_id"];
//            NSNumber *routeID = [NSNumber numberWithInt:[routeIDstring integerValue]];
//            NSString *routeName = object[@"route_long_name"];
//            NSString *routeColor = object[@"route_color"];
//            NSString *routeTextColor = object[@"route_text_color"];
//            Routes *newroute = [[Routes alloc]initWithRouteID:routeID routeName:routeName routeColor:routeColor routeTextColor:routeTextColor];
//            newroute = [NSEntityDescription insertNewObjectForEntityForName:@"Routes" inManagedObjectContext:self.managedObjectContext];
//            [self.managedObjectContext save:nil];
//        }
//    }
//    NSArray *stopsObjects = [parser objectWithString:stopsJsonString];
//    if ([self.stopsFetchedResultsController.fetchedObjects count] ==0) {
//        for (NSDictionary *object in stopsObjects) {
//            NSString *stopIDString = object[@"stop_id"];
//            NSNumber *stopID = [NSNumber numberWithInt:[stopIDString integerValue]];
//            NSString *stopName = object[@"stop_name"];
//            NSString *latString = object[@"stop_lat"];
//            NSNumber *stopLat = [NSNumber numberWithFloat:[latString floatValue]];
//            NSString *lonString = object[@"stop_lon"];
//            NSNumber *stopLon = [NSNumber numberWithFloat:[lonString floatValue]];
//            Stops *newstop = [[Stops alloc]initWithstopId:stopID stopName:stopName stopLatitude:stopLat stopLongitude:stopLon];
//            newstop = [NSEntityDescription insertNewObjectForEntityForName:@"Stops" inManagedObjectContext:self.managedObjectContext];
//            [self.managedObjectContext save:nil];
//            [self.stopsFetchedResultsController performFetch:nil];
//        }
//    }
//    NSArray *tripsObjects = [parser objectWithString:tripsJsonString];
//    if ([self.tripsFetchedResultsController.fetchedObjects count] ==0) {
//        for (NSDictionary *object in tripsObjects ) {
//            NSString *routeIDstring = object[@"route_id"];
//            NSNumber *routeID = [NSNumber numberWithInt:[routeIDstring integerValue]];
//            NSString *serviceID = object[@"service_id"];
//            NSString *tripID = object[@"trip_id"];
//            NSString *tripHeadsign = object[@"trip_headsign"];
//            Trips *newTrip = [[Trips alloc]initWithRouteId:routeID serviceID:serviceID tripId:tripID tripHeadsign:tripHeadsign];
//            newTrip = [NSEntityDescription insertNewObjectForEntityForName:@"Trips" inManagedObjectContext:self.managedObjectContext];
//            [self.managedObjectContext save:nil];
//        }
//    }
//    NSArray *stopTimesObjects = [parser objectWithString:stopTimesJsonString];
//    if ([self.stopTimesFetchedResultsController.fetchedObjects count] ==0) {
//        for (NSDictionary *object in stopTimesObjects) {
//            NSString *tripID = object[@"trip_id"];
//            NSString *arrivalTimeString = object[@"arrival_time"];
//            NSString *departureTimeString = object[@"departure_time"];
//            NSString *stopIDString = object[@"stop_id"];
//            NSNumber *stop_sequence = [NSNumber numberWithInteger:[ object[@"stop_sequence"] integerValue]];
//            NSNumber *stopID = [NSNumber numberWithInt:[stopIDString integerValue]];
//            StopTimes *newstopTime = [[StopTimes alloc]initWithTripID:tripID arrivalTime:arrivalTimeString departureTime:departureTimeString stopID:stopID andStopSequence:stop_sequence];
//            //NSLog(@"new stop time stop sequence %@", newstopTime.stop_sequence);
//            newstopTime = [NSEntityDescription insertNewObjectForEntityForName:@"StopTimes" inManagedObjectContext:self.managedObjectContext];
//            [self.managedObjectContext save:nil];
//        }
//    }
//    NSArray *weekserviceObjects = [parser objectWithString:weekserviceJsonString];
//    if ([self.weekServiceFetchedResultsController.fetchedObjects count] ==0) {
//        for (NSDictionary *object in weekserviceObjects) {
//            NSString *serviceID = object[@"service_id"];
//            NSString *serviceName = object[@"service_name"];
//            NSString *startDateString = object[@"start_date"];
//            NSString *endDateString = object[@"end_date"];
//            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//            [formatter setDateFormat:@"yyyy dd mm"];
//            NSDate *startDate = [formatter dateFromString:startDateString];
//            NSDate *endDate = [formatter dateFromString:endDateString];
//            WeekService *newWeekservice = [[WeekService alloc]initWithServiceID:serviceID serviceName:serviceName startDate:startDate endDate:endDate];
//            newWeekservice = [NSEntityDescription insertNewObjectForEntityForName:@"WeekService" inManagedObjectContext:self.managedObjectContext];
//            [self.managedObjectContext save:nil];
//        }
//    }
//}

@end


