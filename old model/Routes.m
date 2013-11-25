//
//  Routes.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "Routes.h"

@implementation Routes


-(id) initWithRouteID:(NSNumber*) routeID routeName: (NSString*) routeName routeColor :(NSString*) routeColor routeTextColor:(NSString*) routeTextColor {
    self = [super init];
    if (self) {
        self.routeID = routeID;
        self.routeName = routeName;
        self.routeColor = routeColor;
        self.routeTextColor = routeTextColor;
    }
    return self;
}


@end
