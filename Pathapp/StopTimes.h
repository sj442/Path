//
//  StopTimes.h
//  Pathapp
//
//  Created by Sunayna Jain on 12/9/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StopTimes : NSManagedObject

@property (nonatomic, retain) NSString * arrivalTime;
@property (nonatomic, retain) NSString * departureTime;
@property (nonatomic, retain) NSNumber * stopID;
@property (nonatomic, retain) NSString * tripID;
@property (nonatomic, retain) NSNumber * stop_sequence;

@end
