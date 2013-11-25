//
//  ArrivalStopsViewController.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/8/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

@class ArrivalStopsViewController;

@protocol ArrivalStopsViewControllerDelegate <NSObject>

- (void)addItemsViewController:(ArrivalStopsViewController *)controller didFinishEnteringItem:(NSString *)returnItem;

@end


#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ArrivalStopsViewController : UITableViewController

@property (strong, nonatomic) NSArray *stopsArray;

@property (weak) id <ArrivalStopsViewControllerDelegate> delegate;


@end
