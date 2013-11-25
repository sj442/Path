//
//  QueryManager.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "QueryManager.h"
#import "DataStore.h"
#import "Stops+Methods.h"

//@interface QueryManager ()
//
//@property (strong, nonatomic) NSArray *Hob33Stops;
//@property (strong, nonatomic) NSArray *HobWTCStops;
//@property (strong, nonatomic) NSArray *JSQ33Stops;
//@property (strong, nonatomic) NSArray *NwkWTCStops;
//@property (strong, nonatomic) NSArray *JSQHob33Stops;
//@property (strong, nonatomic) NSString *routeID;
//@property (strong, nonatomic) NSString *originRouteID;
//@property (strong, nonatomic) NSString *destinationRouteID;
//@property (strong, nonatomic) NSString *originid;
//@property (strong, nonatomic) NSString *destinationid;
//@property (strong, nonatomic) NSMutableArray *routeIDArray;
//@property (strong, nonatomic) NSMutableArray *arrayOfStopsArrays;
//
//
//@end
//
//@implementation QueryManager
//
//
//+(QueryManager*)sharedQueryManager {
//    
//    static QueryManager *sharedQueryManager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedQueryManager = [[self alloc] init];
//    });
//    return sharedQueryManager;
//}
//
//
//-(NSNumber*)getstopIDFromStopName:(NSString*)stopName {
//    
//    NSNumber *stopID = [[NSNumber alloc]init];
//    
//    NSArray *fetchedStops = [[[DataStore sharedStore] stopsFetchedResultsController] fetchedObjects];
//    
//    NSLog(@"first stop object is:%@", ((Stops*)[fetchedStops firstObject]).stopName);
//    
//                             for (Stops *stop in fetchedStops) {
//                                 
//                                 if ([stopName isEqualToString:stop.stopName]){
//                                     
//                                     stopID = stop.stopID;
//                                 }
//                             }
//    
//    NSLog(@"stop id is:%@", stopID);
//    
//    return stopID;
//}
//
//-(void)stops {
//    
//    self.Hob33Stops =[[NSArray alloc]initWithObjects:@"Hoboken", @"Christopher Street", @"9th Street", @"14th Street", @"23rd Street", @"33rd Street", nil];
//    [self.arrayOfStopsArrays addObject:self.Hob33Stops];
//    
//    self.HobWTCStops = [[NSArray alloc]initWithObjects:@"Hoboken", @"Newport", @"Exchange Place", @"World Trade Center", nil ];
//    
//    [self.arrayOfStopsArrays addObject:self.HobWTCStops];
//
//    
//    self.JSQ33Stops =[ [NSArray alloc]initWithObjects:@"Journal Square", @"Newport", @"Christopher Street", @"9th Street", @"14th Street", @"23rd Street", @"33rd Street", nil];
//    [self.arrayOfStopsArrays addObject:self.JSQ33Stops];
//
//    
//    self.NwkWTCStops = [[NSArray alloc ]initWithObjects:@"Newark", @"Harrison", @"Journal Square", @"Grove Street", @"Exchange Place", @"World Trade Center", nil];
//    [self.arrayOfStopsArrays addObject:self.NwkWTCStops];
//
//    
//    self.JSQHob33Stops =[[NSArray alloc]initWithObjects:@"Journal Square", @"Grove Street", @"Newport", @"Hoboken", @"Christopher Street", @"9th Street", @"14th Street", @"23rd Street", @"33rd Street", nil ];
//    [self.arrayOfStopsArrays addObject:self.JSQHob33Stops];
//}
//
//
//-(void)routeIDstopsMapping {
//
//    
//}
//
////-(void) stopsForRouteId:(NSNumber*)routeID{
////
////    if ([routeID isEqualToNumber:@859]){
////        
////        self.Hob33Stops =[[NSArray alloc]initWithObjects:@"Hoboken", @"Christopher Street", @"9th Street", @"14th Street", @"23rd Street", @"33rd Street", nil];
////        
////    }
////    else if ([routeID isEqualToNumber:@860]) {
////        
////        self.HobWTCStops = [[NSArray alloc]initWithObjects:@"Hoboken", @"Newport", @"Exchange Place", @"World Trade Center", nil ];
////        
////        
////    } else if ([routeID isEqualToNumber:@860]) {
////        
////        self.JSQ33Stops =[ [NSArray alloc]initWithObjects:@"Journal Square", @"Newport", @"Christopher Street", @"9th Street", @"14th Street", @"23rd Street", @"33rd Street", nil];
////        
////
////    }
////    else if ([routeID isEqualToNumber:@860]) {
////        
////        self.NwkWTCStops = [[NSArray alloc ]initWithObjects:@"Newark", @"Harrison", @"Journal Square", @"Grove Street", @"Exchange Place", @"World Trade Center", nil];
////        
////        
////    } else if ([routeID isEqualToNumber:@860]){
////        
////        self.JSQHob33Stops =[[NSArray alloc]initWithObjects:@"Journal Square", @"Grove Street", @"Newport", @"Hoboken", @"Christopher Street", @"9th Street", @"14th Street", @"23rd Street", @"33rd Street", nil ];
////
////    }
////    
////    NSLog(@"hob-33 stoparray count is:%d", [self.Hob33Stops count]);
////}
//
////-(NSString*)routeIDForOriginStop:(NSString*)originstop anddestinationStop:(NSString*)destinationStop{
////    
////    for (int i=0; i<[self.Hob33Stops count]; i++) {
////        if ([originstop isEqualToString:[self.Hob33Stops objectAtIndex:i]]) {
////            [self.originRouteID isEqualToString: @"859"];
////        
////        if ([destinationStop isEqualToString:[self.Hob33Stops objectAtIndex:i]]) {
////            [self.destinationRouteID isEqualToString: @"859"];
////    }
////        
////        if (self.originRouteID ==self.destinationRouteID) {
////            self.routeID = @"859";
////        }
////    }
////    
////        for (int i=0; i<[self.HobWTCStops count]; i++) {
////            if ([originstop isEqualToString:[self.HobWTCStops objectAtIndex:i]]) {
////                [self.originRouteID isEqualToString:@"860"];
////            }
////            if ([destinationStop isEqualToString:[self.HobWTCStops objectAtIndex:i]]) {
////                [self.destinationRouteID isEqualToString:@"860"];
////            }
////            
////            if (self.originRouteID ==self.destinationRouteID) {
////                self.routeID =@"860";
////            }
////        }
////
////            for (int i=0; i<[self.JSQ33Stops count]; i++) {
////                if ([originstop isEqualToString:[self.JSQ33Stops objectAtIndex:i]]) {
////                    [self.originRouteID isEqualToString:@"861"];
////                }
////                if ([destinationStop isEqualToString:[self.JSQ33Stops objectAtIndex:i]]) {
////                    [self.destinationRouteID isEqualToString:@"861"];
////                }
////                
////                if (self.originRouteID ==self.destinationRouteID) {
////                    self.routeID = @"861";
////                }
////            }
////
////                for (int i=0; i<[self.NwkWTCStops count]; i++) {
////                    if ([originstop isEqualToString:[self.NwkWTCStops objectAtIndex:i]]) {
////                        [self.originRouteID isEqualToString:@"862"];
////                    }
////                    if ([destinationStop isEqualToString:[self.NwkWTCStops objectAtIndex:i]]) {
////                        [self.destinationRouteID isEqualToString:@"862"];
////                    }
////                    
////                    if (self.originRouteID ==self.destinationRouteID) {
////                        self.routeID = @"862";
////                    }
////                }
////    
////                    for (int i=0; i<[self.JSQHob33Stops count]; i++) {
////                        if ([originstop isEqualToString:[self.JSQHob33Stops objectAtIndex:i]]) {
////                            [self.originRouteID isEqualToString:@"1024"];
////                        }
////                        if ([destinationStop isEqualToString:[self.JSQHob33Stops objectAtIndex:i]]) {
////                            [self.destinationRouteID isEqualToString:@"1024"];
////                    
////                        
////                        if (self.originRouteID ==self.destinationRouteID==1024) {
////                            self.routeID = @"1024";
////                        }
////                    }
////                        
////                    }
////    
////}
////    
////    NSLog(@"route id:%@", self.routeID);
////    return self.routeID;
////
////}
//
//
////-(NSArray*)routeIDsForOriginStopName:(NSString*)originStopName andDestinationStopname:(NSString*)destinationStopname {
////    
////    self.routeIDArray = [[NSMutableArray alloc]init];
////
////    for (NSArray *array in self.arrayOfStopsArrays) {
////        
////        for (NSString *stop in array) {
////            
////            if ([originStopName isEqualToString:stop]) {
////                
////              [self.originid isEqualToString:[self routeIDForOriginStop:originStopName anddestinationStop:destinationStopname]];
////                
////            }
////            
////            if ([destinationStopname isEqualToString:stop]) {
////                [self.destinationid isEqualToString: [self routeIDForOriginStop:originStopName anddestinationStop:destinationStopname]];
////                
////                NSLog(@"destination route Id:%@", self.destinationid);
////
////            }
////        
////        }
////        
////        if ([self.originid isEqualToString:self.destinationid] ) {
////        
////            [self.routeIDArray addObject:self.originid];
////        }
////        
////        else  {
////            NSLog(@"Transfer case");
////        }
////    }
////    
////    NSLog(@"route ID array count:%d", [self.routeIDArray count]);
////    
////    return self.routeIDArray;
////    
////}
//
//
//
//@end
