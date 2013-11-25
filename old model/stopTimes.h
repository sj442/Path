//
//  stopTimes.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface stopTimes : NSObject

@property (strong, nonatomic) NSString *tripID;
@property (strong, nonatomic) NSDate *arrivalTime;
@property (strong, nonatomic) NSDate *departureTime;
@property (strong, nonatomic) NSNumber *stopID;

-(id)initWithTripID:(NSString*) tripID arrivalTime: (NSDate*) arrivalTime departureTime: (NSDate*) departureTime stopID:(NSNumber*) stopID;

@end
