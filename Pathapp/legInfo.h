//
//  legInfo.h
//  Pathapp
//  Created by Sunayna Jain on 11/11/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface legInfo : NSObject

@property (strong, nonatomic) NSString *TrainName;
@property (strong, nonatomic) NSString *departureTime;
@property (strong, nonatomic) NSString *arrivalTime;
@property (strong, nonatomic) NSString *headsign;
@property (strong, nonatomic) NSString *duration;
@property (strong, nonatomic) NSString *numberOfStops;
@property (strong, nonatomic) NSString *instructions;
@property (strong, nonatomic) NSString *departureStop;
@property (strong, nonatomic) NSString *arrivalStop;
@property (strong, nonatomic) NSString *legColor;
@property (strong, nonatomic) NSString *legPath;

-(id)initWithTrainName:(NSString*)trainName departureStop:(NSString*) departurteStop departureTime: (NSString*)departureTime arrivalStop:(NSString*)arrivalStop arrivalTime:(NSString*)arrivalTime duration:(NSString*)duration andHeadsign:(NSString*)headsign andNumberofStops:(NSString*)numStops andInstructions:(NSString*)instructions andlegColor:(NSString*)legColor andlegPath:(NSString*)legPath;

@end
