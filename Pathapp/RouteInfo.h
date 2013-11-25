//
//  RouteInfo.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/8/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "legInfo.h"

@interface RouteInfo : NSObject

@property (strong, nonatomic) NSMutableArray *legs;
@property int duration_secs;
@property (strong, nonatomic) NSArray *path;

-(id)initWithTrainName:(NSArray*)trainName departureStop:(NSArray*) departureStop departureTime: (NSArray*)departureTime arrivalstop:(NSArray*) arrivalstop arrivalTime:(NSArray*)arrivalTime duration:(NSArray*)duration andHeadsign:(NSArray*)headsign andNumberofStops:(NSArray*)numStops andInstructions:(NSArray*)instructions andlegColor:(NSString*)legColor andlegPath:(NSArray*)legPath;

-(id)initWithLegs:(NSMutableArray *)legs duration:(int) duration_secs andPath:(NSArray*)routePath;

-(NSString *)getRouteStartTime;
-(NSString *)getRouteEndTime;
-(NSArray*) getTransferStops;

@end
