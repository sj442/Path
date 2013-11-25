//
//  Routes.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Routes : NSObject

@property (strong, nonatomic) NSNumber *routeID;
@property (strong, nonatomic) NSString *routeName;
@property (strong, nonatomic) NSString *routeColor;
@property (strong, nonatomic) NSString *routeTextColor;

-(id) initWithRouteID:(NSNumber*) routeID routeName: (NSString*) routeName routeColor :(NSString*) routeColor routeTextColor:(NSString*) routeTextColor;

@end
