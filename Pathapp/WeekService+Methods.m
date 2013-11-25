//
//  WeekService+Methods.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "WeekService+Methods.h"
#import "DataStore.h"

@implementation WeekService (Methods)

-(id)initWithServiceID: (NSString*)serviceID serviceName:(NSString*)serviceName startDate: (NSDate*)startDate endDate:(NSDate*)endDate {
    
 self = [NSEntityDescription insertNewObjectForEntityForName:@"WeekService" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];
    if (self) {
        self.serviceID = serviceID;
        self.serviceName = serviceName;
        self.startDate = startDate;
        self.endDate = endDate;
    }
    return self;
}

@end
