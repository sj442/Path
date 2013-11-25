//
//  Stops+Methods.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "Stops+Methods.h"
#import "DataStore.h"

@implementation Stops (Methods)

-(id)initWithstopId: (NSNumber*) stop_id stopName:(NSString*)stopName  stopLatitude:(NSNumber*)latitude stopLongitude:(NSNumber*)longitude{
    
self = [NSEntityDescription insertNewObjectForEntityForName:@"Stops" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];
    if (self) {
        self.stopID = stop_id;
        self.stopName = stopName;
        self.latitude = latitude;
        self.longitude = longitude;
        
    }
    return self;
    
}

@end
