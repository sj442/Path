//
//  QueryManager.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueryManager : NSObject

@property (strong, nonatomic) NSString *originStop;
@property (strong, nonatomic) NSString *destinationStop;
@property (strong, nonatomic) NSDate* departureTime;


+(QueryManager*)sharedQueryManager;

-(NSNumber*)getstopIDFromStopName: (NSString*)stopName;

-(void) stopsForRouteId:(NSNumber*)routeID;

-(void)stops;

-(NSString*)routeIDForOriginStop: (NSString*)originstop anddestinationStop:(NSString*)destinationStop;

-(NSArray*)routeIDsForOriginStopName:(NSString*)originStopName andDestinationStopname:(NSString*)destinationStopname;


@end
