//
//  Trips+Methods.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "Trips+Methods.h"
#import "DataStore.h"

@implementation Trips (Methods)

-(id)initWithRouteId: (NSNumber*)routeID serviceID:(NSString*) serviceID tripId:(NSString*)tripID tripHeadsign:(NSString*) tripHeadsign {
self = [NSEntityDescription insertNewObjectForEntityForName:@"Trips" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];    if (self){
        self.routeID = routeID;
        self.serviceID = serviceID;
        self.tripID = tripID;
        self.tripHeadsign = tripHeadsign;
    }
    return self;
}


@end
