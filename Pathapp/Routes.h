//
//  Routes.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/7/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Routes : NSManagedObject

@property (nonatomic, retain) NSString * routeColor;
@property (nonatomic, retain) NSNumber * routeID;
@property (nonatomic, retain) NSString * routeName;
@property (nonatomic, retain) NSString * routeTextCOlor;

@end
