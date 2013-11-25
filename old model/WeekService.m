//
//  WeekService.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "WeekService.h"

@implementation WeekService

-(id)initWithServiceID: (NSString*)serviceID serviceName:(NSString*)serviceName startDate: (NSDate*)startDate endDate:(NSDate*)endDate {
    
    self = [super init];
    
    if (self) {
        self.serviceID = serviceID;
        self.serviceName = serviceName;
        self.startDate = startDate;
        self.endDate = endDate;
    }
            
            
    return self;
    
    
}

@end
