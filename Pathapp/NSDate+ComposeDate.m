//
//  NSDate+ComposeDate.m
//  Pathapp
//
//  Created by Sunayna Jain on 1/7/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "NSDate+ComposeDate.h"

@implementation NSDate (ComposeDate)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute seconds:(NSInteger)seconds{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    [dateComponents setYear:year];
    [dateComponents setMonth:month];
    [dateComponents setDay:day];
    [dateComponents setHour:hour];
    [dateComponents setMinute:minute];
    [dateComponents setSecond:seconds];
     return [calendar dateFromComponents:dateComponents];
}


@end
