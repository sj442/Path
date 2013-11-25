//
//  StopTimes+Methods.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "StopTimes.h"

@interface StopTimes (Methods)

-(id)initWithTripID:(NSString*) tripID arrivalTime: (NSDate*) arrivalTime departureTime: (NSDate*) departureTime stopID:(NSNumber*) stopID;

@end
