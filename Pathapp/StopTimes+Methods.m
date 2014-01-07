//
//  StopTimes+Methods.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "StopTimes+Methods.h"
#import "DataStore.h"

@implementation StopTimes (Methods)

-(id)initWithTripID:(NSString*) tripID arrivalTime: (NSString*) arrivalTime departureTime: (NSString*) departureTime stopID:(NSNumber*) stopID andStopSequence:(NSNumber *)stopSequence{
self = [NSEntityDescription insertNewObjectForEntityForName:@"StopTimes" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];
    if (self) {
        self.tripID = tripID;
        self.arrivalTime = arrivalTime;
        self.departureTime = departureTime;
        self.stopID = stopID;
        self.stop_sequence = stopSequence;
    }
    return self;
}

@end
