//
//  Trips.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Trips : NSManagedObject

@property (nonatomic, retain) NSNumber * routeID;
@property (nonatomic, retain) NSString * serviceID;
@property (nonatomic, retain) NSString * tripHeadsign;
@property (nonatomic, retain) NSString * tripID;
@property (nonatomic, retain) NSString * tripName;

@end
