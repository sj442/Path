//
//  APIStore.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RouteInfo.h"
#import "Stops+Methods.h"
#import "DataStore.h"

@interface APIStore : NSObject

@property (strong, nonatomic) NSMutableArray *routesArray;


@property (strong, nonatomic) NSMutableArray *errorArray;



+(APIStore*)sharedAPIStore;

-(void)getdirectionsForOriginLat:(NSNumber*)originLat originLon:(NSNumber*)originLon destinationLat:(NSNumber*)destinationLat destinationLog: (NSNumber*) destinationLon andDepartureTime:(NSNumber*)departureTime withCompletion:(void (^)(NSArray* routeArray))block;

-(NSNumber*)getLatitudeForStop:(NSString*)stopName;

-(NSNumber*)getLongitudeForStop:(NSString*)stopName;




@end
