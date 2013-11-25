//
//  legInfo.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/11/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "legInfo.h"

@implementation legInfo

-(id)initWithTrainName:(NSString*)trainName departureStop:(NSString*) departurteStop departureTime: (NSString*)departureTime arrivalStop:(NSString*)arrivalStop arrivalTime:(NSString*)arrivalTime duration:(NSString*)duration andHeadsign:(NSString*)headsign andNumberofStops:(NSString*)numStops andInstructions:(NSString*)instructions andlegColor:(NSString *)legColor andlegPath:(NSString *)legPath{
    self = [super init];
    if (self) {
        self.TrainName = trainName;
        self.departureTime = departureTime;
        self.arrivalTime = arrivalTime;
        self.duration = duration;
        self.headsign = headsign;
        self.numberOfStops = numStops;
        self.instructions = instructions;
        self.departureStop = departurteStop;
        self.arrivalStop = arrivalStop;
        self.legColor = legColor;
        self.legPath = legPath;
        
        NSLog(@"Creating leg with departureStop as %@ and arrivalStop as %@", self.departureStop, self.arrivalStop);
    }
    return self;
}

-(id)init {
    return [self initWithTrainName:@"" departureStop:@"" departureTime:@"" arrivalStop:@"" arrivalTime:@"" duration:@"" andHeadsign:@"" andNumberofStops:@"1" andInstructions:@"" andlegColor:@"" andlegPath:@""];
}

@end
