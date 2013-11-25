//
//  RouteInfo.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/8/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "RouteInfo.h"

@implementation RouteInfo

-(id)initWithTrainName:(NSArray*)trainName departureStop:(NSArray*) departureStop departureTime: (NSArray*)departureTime arrivalstop:(NSArray*) arrivalstop arrivalTime:(NSArray*)arrivalTime duration:(NSArray*)duration andHeadsign:(NSArray*)headsign andNumberofStops:(NSArray*)numStops andInstructions:(NSArray*)instructions andlegColor:(NSArray*)legColor andlegPath:(NSArray *)legPath{
self = [super init];
    if (self) {
        self.legs = [[NSMutableArray alloc] init];
        for (int i = 0; i < [trainName count]; i++) {
            legInfo *newleg = [[legInfo alloc] initWithTrainName:[trainName objectAtIndex:i] departureStop:[departureStop objectAtIndex:i] departureTime:[departureTime objectAtIndex:i] arrivalStop:[arrivalstop objectAtIndex:i] arrivalTime:[arrivalTime objectAtIndex:i] duration:[duration objectAtIndex:i] andHeadsign:[headsign objectAtIndex:i] andNumberofStops:[numStops objectAtIndex:i] andInstructions:[instructions objectAtIndex:i] andlegColor:[legColor objectAtIndex:i] andlegPath:[legPath objectAtIndex:i]];
            [self.legs addObject:newleg];
        }
    }
    return self;
}

-(id)initWithLegs:(NSMutableArray *) legs duration:(int)duration_secs andPath:(NSArray *)routePath{
    self = [super init];
    if (self) {
        self.legs = legs;
        self.duration_secs = duration_secs;
        self.path = routePath;
    }
    return self;
}

-(NSString *)getRouteStartTime {
    if ([self.legs count] > 0) {
        return [[self.legs firstObject] departureTime];
    } else {
        return @"NULL";
    }
}

-(NSString *)getRouteEndTime {
    if ([self.legs count] > 0) {
        return [[self.legs lastObject] arrivalTime];
    } else {
        return @"NULL";
    }
}

-(NSMutableArray*) getTransferStops{
    NSMutableArray *stops = [[NSMutableArray alloc]init];
    //NSLog(@"legs count:%d", [self.legs count]);
    for (int i=0; i<[self.legs count] - 1; i++) {
        legInfo *this_leg = [self.legs objectAtIndex:i];
        //NSLog(@"departure stop:%@", [this_leg arrivalStop]);
        [stops addObject:([this_leg arrivalStop])];
    }
    return stops;
}
@end
