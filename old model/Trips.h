//
//  Trips.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trips : NSObject

@property (strong, nonatomic) NSNumber *routeID;
@property (strong, nonatomic) NSString *serviceID;
@property (strong, nonatomic) NSString *tripID;
@property (strong, nonatomic) NSString *tripHeadsign;


-(id)initWithRouteId: (NSNumber*)routeID serviceID:(NSString*) serviceID tripId:(NSString*)tripID  tripHeadsign:(NSString*) tripHeadsign;

@end
