//
//  WeekService.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeekService : NSObject

@property (strong, nonatomic) NSString *serviceID;
@property (strong, nonatomic) NSString *serviceName;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;

-(id)initWithServiceID: (NSString*)serviceID serviceName:(NSString*)serviceName startDate: (NSDate*)startDate endDate:(NSDate*)endDate;

@end
