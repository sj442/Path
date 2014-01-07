//
//  ViewController.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/5/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllStopsViewController.h"
#import  "ArrivalStopsViewController.h"

@interface ViewController : UIViewController <AllStopsViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *nowButton;

- (IBAction)nowPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *chooseDateButton;

@property (weak, nonatomic) IBOutlet UIButton *chooseTimeButton;

- (IBAction)chooseDateClicked:(id)sender;

- (IBAction)chooseTimeClicked:(id)sender;

@property (strong, nonatomic) NSString *departureStation;
@property (strong, nonatomic) NSString *arrivalStation;
@property (strong, nonatomic) NSDate *dateChosen;
@property (strong, nonatomic) NSDate *timeChosen;
@property (strong, nonatomic) NSNumber *timeInterval;

@property (weak, nonatomic) IBOutlet UIButton *departureButton;

@property (weak, nonatomic) IBOutlet UIButton *arrivalButton;


- (IBAction)arrivalButtonClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *swapButton;

- (IBAction)swapButtonClicked:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *goButton;

- (IBAction)goPressed:(id)sender;















@end
