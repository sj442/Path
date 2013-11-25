//
//  StopTimes.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StopTimes : NSManagedObject

@property (nonatomic, retain) NSDate * arrivalTime;
@property (nonatomic, retain) NSDate * departureTime;
@property (nonatomic, retain) NSNumber * stopID;
@property (nonatomic, retain) NSString * tripID;

@end
