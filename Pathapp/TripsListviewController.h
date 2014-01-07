//
//  TripsListviewController.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIStore.h"
#import "ViewController.h"
#import "RouteInfo.h"

@interface TripsListviewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (strong, nonatomic) NSString *tripName;
@property (strong, nonatomic) NSString *tripDuration;
@property (strong, nonatomic) NSDate *arrival_time;
@property (strong, nonatomic) NSDate *departure_time;
@property (strong, nonatomic) NSArray *routes;


@end
