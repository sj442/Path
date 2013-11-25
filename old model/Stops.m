//
//  Stops.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "Stops.h"

@implementation Stops

-(id)initWithstopId: (NSNumber*) stop_id stopName:(NSString*)stopName  stopLatitude:(NSNumber*)latitude stopLongitude:(NSNumber*)longitude{
    
    self = [super init];
    
    if (self) {
        self.stop_id = stop_id;
        self.stopName = stopName;
        self.latitude = latitude;
        self.longitude = longitude;
        
    }
    return self;
    
}


@end
