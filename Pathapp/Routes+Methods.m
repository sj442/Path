//
//  Routes+Methods.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "Routes+Methods.h"
#import "DataStore.h"

@implementation Routes (Methods)

-(id) initWithRouteID:(NSNumber*) routeID routeName: (NSString*) routeName routeColor :(NSString*) routeColor routeTextColor:(NSString*) routeTextColor {
    self = [NSEntityDescription insertNewObjectForEntityForName:@"Routes" inManagedObjectContext:[DataStore sharedStore].managedObjectContext];
    if (self) {
        self.routeID = routeID;
        self.routeName = routeName;
        self.routeColor = routeColor;
        self.routeTextCOlor = routeTextColor;
    }
    return self;
}






@end
