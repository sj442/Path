//
//  DetailViewController.h
//  Pathapp
//
//  Created by Sachin Jindal on 11/19/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RouteInfo.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) RouteInfo *route;

- (IBAction)showMapClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *showMap;


@end
