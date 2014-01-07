//
//  StopTimes+Methods.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "StopTimes.h"

@interface StopTimes (Methods)

-(id)initWithTripID:(NSString*) tripID arrivalTime: (NSString*) arrivalTime departureTime: (NSString*) departureTime stopID:(NSNumber*) stopID andStopSequence:(NSNumber*) stopSequence;

@end
