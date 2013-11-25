//
//  Trips+Methods.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "Trips.h"

@interface Trips (Methods)

-(id)initWithRouteId: (NSNumber*)routeID serviceID:(NSString*) serviceID tripId:(NSString*)tripID  tripHeadsign:(NSString*) tripHeadsign;

@end
