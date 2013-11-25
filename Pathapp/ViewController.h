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


- (IBAction)DatePressed:(id)sender;

- (IBAction)TimePressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *datePickerView;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)donePressed:(id)sender;

- (IBAction)cancelPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *dateButton;

@property (weak, nonatomic) IBOutlet UIButton *timeButton;


@property (weak, nonatomic) IBOutlet UIView *timePickerView;

@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;


@property (weak, nonatomic) IBOutlet UIButton *timePickerDone;

@property (weak, nonatomic) IBOutlet UIButton *timePickerCancel;

- (IBAction)timePickerDonePressed:(id)sender;

- (IBAction)timePickerCancelPressed:(id)sender;

- (IBAction)nowPressed:(id)sender;

@property (strong, nonatomic) NSString *departureStation;
@property (strong, nonatomic) NSString *rrivalStation;
@property (strong, nonatomic) NSDate *dateChosen;
@property (strong, nonatomic) NSDate *timeChosen;
@property (strong, nonatomic) NSNumber *timeInterval;


@property (weak, nonatomic) IBOutlet UIButton *departureButton;

@property (weak, nonatomic) IBOutlet UIButton *arrivalButton;

- (IBAction)departureButtonPresses:(id)sender;

- (IBAction)arrivalButtonClicked:(id)sender;

- (IBAction)GoPressed:(id)sender;



















@end
