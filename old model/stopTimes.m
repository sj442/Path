//
//  stopTimes.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "stopTimes.h"

@implementation stopTimes

-(id)initWithTripID:(NSString*) tripID arrivalTime: (NSDate*) arrivalTime departureTime: (NSDate*) departureTime stopID:(NSNumber*) stopID{
    self = [super init];
    if (self) {
        self.tripID = tripID;
        self.arrivalTime = arrivalTime;
        self.departureTime = departureTime;
        self.stopID = stopID;
    }
    
    return self;
}


@end
