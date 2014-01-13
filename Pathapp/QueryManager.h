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

-(NSArray*)getTripsForDepartureStation:(NSString*)departureStation andArrivalStation:(NSString*) arrivalStation andDepartAtTime:(NSString*) departTime andArriveByTime:(NSString*)ArriveTime andDate:(NSString*)tripDate;

-(NSString*)getDayFromDate:(NSDate*)date;

-(NSArray*)getStopTimeForTripID:(NSString*)tripID andStopSequence:(NSNumber*)stopSequence;


@end
