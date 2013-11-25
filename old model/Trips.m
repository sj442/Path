//
//  Trips.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "Trips.h"

@implementation Trips

-(id)initWithRouteId: (NSNumber*)routeID serviceID:(NSString*) serviceID tripId:(NSString*)tripID tripHeadsign:(NSString*) tripHeadsign {
    self=[super init];
    if (self){
        self.routeID = routeID;
        self.serviceID = serviceID;
        self.tripID = tripID;
        self.tripHeadsign = tripHeadsign;
    }
    return self;
}

@end
