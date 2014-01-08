//
//  APIStore.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "APIStore.h"
#import <AFNetworking.h>
#import "RouteInfo.h"
#import "legInfo.h"

@implementation APIStore

+(APIStore*)sharedAPIStore {
    static APIStore *sharedAPIStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAPIStore = [[self alloc] init];
        NSLog(@"Creating another instance of APIStore");
    });
    return sharedAPIStore;
}

-(void)getdirectionsForOriginLat:(NSNumber*)originLat originLon:(NSNumber*)originLon destinationLat:(NSNumber*)destinationLat destinationLog: (NSNumber*) destinationLon andDepartureTime:(NSNumber*)departureTime withCompletion:(void (^)(NSArray* routeArray))block{
    
    self.routesArray = [[NSMutableArray alloc]init];
    NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/directions/json?origin=%@,%@&destination=%@,%@&sensor=false&departure_time=%@&mode=transit&alternatives=true", originLat, originLon, destinationLat, destinationLon, departureTime];
    
    NSURLRequest *urlRequest  = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    for (int i=0; i<5; i++) {
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            
            NSLog(@"Json is:%@", JSON);
            NSArray *JSONarray = (NSArray*)JSON[@"routes"];
            
            for (NSDictionary *route in JSONarray) {
                
                NSMutableArray *routePatharray = [[NSMutableArray alloc]init];
                bool route_valid = YES;
                NSArray *legs = route[@"legs"];
                NSMutableArray *legArray = [[NSMutableArray alloc]init];
                int tripDuration = 0;
                for (NSDictionary *leg in legs) {
                    NSArray *steps = leg[@"steps"];
                    tripDuration += [leg[@"duration"][@"value"] integerValue];
                    for (NSDictionary *step in steps) {
                        NSDictionary *transit = step[@"transit_details"];
                        NSString *instructions =step[@"html_instructions"];
                        NSString *numStops = transit[@"num_stops"];
                        NSString *departureStop = transit[@"departure_stop"][@"name"];
                        NSString *arrivalstop = transit[@"arrival_stop"][@"name"];
                        NSString *arrivalTimeString = transit[@"arrival_time"][@"text"];
                        NSString *departureTimeString = transit[@"departure_time"][@"text"];
                        NSString *durationString = step[@"duration"][@"text"];
                        NSString *path = step[@"polyline"][@"points"];
                        [routePatharray addObject:path];
                        NSString *headsign = transit[@"headsign"];
                        NSString *trainName = transit[@"line"][@"name"];
                        NSString *trainShortName = transit[@"line"][@"short_name"];
                        NSString *travelMode = step[@"travel_mode"];
                        NSString *legColor = transit[@"line"][@"color"];
                        if ([travelMode isEqualToString:@"TRANSIT"] && [trainShortName isEqualToString:@"PATH"]) {
                            legInfo *leg = [[legInfo alloc]initWithTrainName:trainName departureStop:departureStop departureTime:departureTimeString arrivalStop:arrivalstop arrivalTime:arrivalTimeString duration:durationString andHeadsign:headsign andNumberofStops:numStops andInstructions:instructions andlegColor:legColor andlegPath:path];
                            NSLog(@"leg train name:%@", leg.TrainName);
                            [legArray addObject:leg];
                        } else {
                            route_valid = NO;
                            break;
                        }
                    }
                    if (route_valid == NO) {
                        break;
                    }
                }
                if (route_valid == YES) {
                    RouteInfo *route = [[RouteInfo alloc]initWithLegs:legArray duration:tripDuration andPath:routePatharray];
                    [self.routesArray addObject:route];
                }
            }
            block(self.routesArray);
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            if (error) {
                NSLog(@"error is:%@", error);
                [self.errorArray addObject:error];
            }
        }];
        [operation start];
        if ([self.errorArray count] ==0) {
            break;
        }
    }
}

-(NSNumber*)getLatitudeForStop:(NSString*)stopName{
    NSNumber *lat = [[NSNumber alloc]init];
    NSArray *stops = [DataStore sharedStore].stopsFetchedResultsController.fetchedObjects;
    for (Stops *stop in stops) {
        if ([stopName isEqualToString:stop.stopName]) {
            lat = stop.latitude;
        }
    }
    return lat;
}

-(NSNumber*)getLongitudeForStop:(NSString*)stopName{
    NSNumber *lon = [[NSNumber alloc]init];
    NSArray *stops = [DataStore sharedStore].stopsFetchedResultsController.fetchedObjects;
    for (Stops *stop in stops) {
        if ([stopName isEqualToString:stop.stopName]) {
            lon = stop.longitude;
        }
    }
    return lon;
}

@end
