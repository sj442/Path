//
//  AllStopsViewController.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/8/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//


@class AllStopsViewController;

@protocol AllStopsViewControllerDelegate <NSObject>

- (void)addItemViewController:(AllStopsViewController *)controller didFinishEnteringItem:(NSString *)item;

@end

#import <UIKit/UIKit.h>

@interface AllStopsViewController : UITableViewController

@property (strong, nonatomic) NSArray *stopsArray;

@property (weak) id <AllStopsViewControllerDelegate> delegate;

@end
