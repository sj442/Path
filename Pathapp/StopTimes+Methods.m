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

-(id)initWithTripID:(NSString*) tripID arrivalTime: (NSDate*) arrivalTime departureTime: (NSDate*) departureTime stopID:(NSNumber*) stopID{
self = [NSEntityDescription insertNewObjectForEntityForName:@"StopTimes" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];    if (self) {
        self.tripID = tripID;
        self.arrivalTime = arrivalTime;
        self.departureTime = departureTime;
        self.stopID = stopID;
    }
    
    return self;
}


@end
