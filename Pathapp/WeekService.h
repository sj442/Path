//
//  WeekService.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WeekService : NSManagedObject

@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSString * serviceID;
@property (nonatomic, retain) NSString * serviceName;
@property (nonatomic, retain) NSDate * startDate;

@end
