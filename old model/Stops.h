//
//  Stops.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stops : NSObject

@property (strong, nonatomic) NSNumber *stop_id;
@property (strong, nonatomic) NSString *stopName;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;


-(id)initWithstopId: (NSNumber*) stop_id  stopName:(NSString*)stopName stopLatitude:(NSNumber*)latitude stopLongitude:(NSNumber*)longitude;

@end
