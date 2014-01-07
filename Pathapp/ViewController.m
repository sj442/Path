//
//  ViewController.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/5/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "ViewController.h"
#import "Stops.h"
#import "DataStore.h"
#import "QueryManager.h"
#import "APIStore.h"
#import "RouteInfo.h"
#import "AllStopsViewController.h"
#import "ArrivalStopsViewController.h"
#import "TripsListviewController.h"
#import "UIButton+border.h"
#import <MMPickerView.h>

@interface ViewController ()

@property (strong, nonatomic) NSArray *stopsArray;

@property (strong, nonatomic) NSString *selectedDate;


@end

@implementation ViewController




- (void)viewDidLoad

{
    [super viewDidLoad];
        
    self.title = @"PATH";
    
    self.view.backgroundColor = [UIColor colorWithRed:0.1f green:0.4f blue:0.9f alpha:0.5f];
    
    //[[DataStore sharedStore] jsonParser];
    
    [self.nowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.nowButton setButtonRoundedborder:3.0f borderwidth:2.0f color:[UIColor whiteColor]];
    
    [self.goButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.goButton setButtonRoundedborder:3.0f borderwidth:2.0f color:[UIColor whiteColor]];
       
    [self.departureButton setTitle:@"Departure Station" forState:UIControlStateNormal];
    
    [self.departureButton setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1.0f]];
    
    self.departureButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0f];
    
    [self.departureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIButton *trainicon = [[UIButton alloc]initWithFrame:CGRectMake(5, 7, 25, 25)];
    
    [self.departureButton addSubview:trainicon];
    
    [trainicon setBackgroundImage:[UIImage imageNamed:@"trainicon.jpg"] forState:UIControlStateNormal];
    
    [self.arrivalButton setTitle:@"Arrival Station" forState:UIControlStateNormal];
    
    [self.arrivalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.arrivalButton setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1.0f]];
    
    UIButton *trainButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 7, 25, 25)];
    
    [trainButton setBackgroundImage:[UIImage imageNamed:@"trainicon.jpg"] forState:UIControlStateNormal];
    
    [self.arrivalButton addSubview:trainButton];
    
    [self.swapButton setBackgroundImage:[UIImage imageNamed:@"swap.png"] forState:UIControlStateNormal];
    
    self.arrivalButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0f];

    self.stopsArray = [[NSArray alloc]initWithObjects:@"Hoboken", @"Newport", @"Newark Penn Station", @"Harrison", @"Journal Square", @"Exchange Place", @"Grove Street", @"World Trade Center", @"Christopher Street", @"9th Street", @"14th Street", @"23rd Street", @"33rd Street", nil];

    NSLog(@"Reached here");
    
        }

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd MMM yy"];
    NSString *defaultDateString = [formatter stringFromDate:date];
    NSString *dateChosenString = [formatter stringFromDate:self.dateChosen];
    NSLog(@"current date:%@", defaultDateString);
    NSLog(@"departure station:%@", self.departureStation);
    NSLog(@"arrival Station:%@", self.arrivalStation);
}


-(NSNumber*)convertOriginToOriginLatitude {
    NSNumber *lat =  [[APIStore sharedAPIStore] getLatitudeForStop:self.departureStation];
    return lat;
}

-(NSNumber*)convertOriginToOriginLongitude {
    NSNumber *lon =  [[APIStore sharedAPIStore] getLongitudeForStop:self.departureStation];
    return lon;
}

-(NSNumber*)convertDestinationToDestinationLatitude {
NSNumber *lat =  [[APIStore sharedAPIStore] getLatitudeForStop:self.arrivalStation];
    return lat;
}

-(NSNumber*)convertDestinationToDestinationLongitude {
NSNumber *lon =  [[APIStore sharedAPIStore] getLongitudeForStop:self.arrivalStation];
    return lon;
}


//#pragma mark- datePickerMethods
//
//- (IBAction)DatePressed:(id)sender {
//    self.datePickerView.hidden = NO;
//    NSArray *viewArray = self.datePickerView.subviews;
//    NSLog(@"first object:%@", [viewArray firstObject] );
//}
//
//- (IBAction)TimePressed:(id)sender {
//    self.timePickerView.hidden = NO;
//    NSArray *viewArray = self.timePickerView.subviews;
//    NSLog(@"first object:%@", [viewArray firstObject] );
//    self.timePickerView.hidden = NO;
//}
//
//- (IBAction)donePressed:(id)sender {
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    
//    [formatter setDateFormat:@"dd MMM yy"];
//    
//    NSString *dateString = [formatter stringFromDate:((UIDatePicker*)[self.datePickerView.subviews firstObject]).date];
//    
//    self.dateChosen = ((UIDatePicker*)[self.datePickerView.subviews firstObject]).date;
//    
//    self.dateButton.titleLabel.text = dateString;
//    
//    self.datePickerView.hidden = YES;
//    
//    NSLog(@"date is:%@", dateString);
//}
//
//-(void)configureDatePicker{
//    
//    ((UIDatePicker*)[self.datePickerView.subviews firstObject]).datePickerMode = UIDatePickerModeDate;
//}
//
//- (IBAction)cancelPressed:(id)sender {
//    self.datePickerView.hidden = YES;
//}
//
//#pragma mark- timepickermethods
//
//- (IBAction)timePickerDonePressed:(id)sender {
//    self.timeChosen = ((UIDatePicker*)[self.timePickerView.subviews firstObject]).date;
//    self.timePickerView.hidden = YES;
//    NSLog(@"time chosen:%@", self.timeChosen);
//}
//
//- (IBAction)timePickerCancelPressed:(id)sender {
//    self.timePickerView.hidden = YES;
//}
//


- (IBAction)nowPressed:(id)sender {
    
    self.timeChosen = [NSDate date];
    NSDate *referenceDate = [NSDate dateWithTimeIntervalSince1970:0];
    NSLog(@"time chosen:%@", self.timeChosen);
    NSTimeInterval timeInterval = [self.timeChosen timeIntervalSinceNow];
    NSTimeInterval referenceTimeInterval = [referenceDate timeIntervalSinceNow];
    NSTimeInterval diff = timeInterval-referenceTimeInterval;
    self.timeInterval = [NSNumber numberWithInteger:roundf(diff)];
    NSLog(@"time in seconds:%f", diff);
    
    [[APIStore sharedAPIStore] getdirectionsForOriginLat:[self convertOriginToOriginLatitude] originLon:[self convertOriginToOriginLongitude] destinationLat: [self convertDestinationToDestinationLatitude] destinationLog:[self convertDestinationToDestinationLongitude] andDepartureTime:self.timeInterval withCompletion:^(NSArray *routesArray) {
        NSLog(@"Route count:%d",[[APIStore sharedAPIStore].routesArray count]);
        //NSLog(@"First leg name is:%@", ((RouteInfo*)[routesArray firstObject]).TrainName);
        //NSLog(@"Route starts from:%@", ((legInfo*)[legArray firstObject]).headsign);
        NSLog(@"shared store route count:%lu", (unsigned long)[[APIStore sharedAPIStore].routesArray count]);
        NSLog(@"shared instance:%@",[APIStore sharedAPIStore]);
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        TripsListviewController *tlvc = [storyboard instantiateViewControllerWithIdentifier:@"tripsList"];
        [self.navigationController pushViewController:tlvc animated:YES];
    }];
}

- (IBAction)departureButtonClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AllStopsViewController *asvc = [storyboard instantiateViewControllerWithIdentifier:@"allStops"];
    asvc.delegate = self;
    [self.navigationController presentViewController:asvc animated:YES completion:nil];
}

- (IBAction)arrivalButtonClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ArrivalStopsViewController *arvc = [storyboard instantiateViewControllerWithIdentifier:@"allArrivalStops"];
    arvc.delegate = self;
    [self.navigationController presentViewController:arvc animated:YES completion:nil];
}

//- (IBAction)GoPressed:(id)sender {
//
//    NSDate *referenceDate = [NSDate dateWithTimeIntervalSince1970:0];
//    
//    NSTimeInterval timeInterval = [self.dateChosen timeIntervalSinceNow];
//    NSTimeInterval referenceTimeInterval = [referenceDate timeIntervalSinceNow];
//    
//    NSTimeInterval diff = timeInterval-referenceTimeInterval;
//    self.timeInterval = [NSNumber numberWithInteger:round(diff)];
//    NSLog(@"time in seconds:%f", diff);
//    
//    [[APIStore sharedAPIStore] getdirectionsForOriginLat:[self convertOriginToOriginLatitude] originLon:[self convertOriginToOriginLongitude] destinationLat: [self convertDestinationToDestinationLatitude] destinationLog:[self convertDestinationToDestinationLongitude] andDepartureTime:self.timeInterval withCompletion:^(NSArray *routeArray) {
//        NSLog(@"route count:%d",[routeArray count]);
//        
//        [self performSegueWithIdentifier:@"tripsList" sender:(id) sender];
//    }];
//}

#pragma  mark- ViewControllerProtocolMethods

- (void)addItemViewController:(AllStopsViewController *)controller didFinishEnteringItem:(NSString *)item
{
    NSLog(@"this was returned:%@", item);
    self.departureStation = [[NSString alloc]initWithString:item];
    NSLog(@"%@", self.departureStation);
    [self.departureButton setTitle:self.departureStation forState:UIControlStateNormal];
    NSLog(@"got here");
 }

- (void)addItemsViewController:(ArrivalStopsViewController *)controller didFinishEnteringItem:(NSString *)returnItem
{
    NSLog(@"this was returned:%@", returnItem);
    self.arrivalStation = [[NSString alloc]initWithString:returnItem];
    NSLog(@"%@", self.arrivalStation);
    [self.arrivalButton setTitle:self.arrivalStation forState:UIControlStateNormal];
    NSLog(@"got here");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //if ([[segue identifier] isEqualToString:@"tripsList"]){
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TripsListviewController *tlvc = [storyboard instantiateViewControllerWithIdentifier:@"tripsList"];
        tlvc = [segue destinationViewController];
    }
    
- (IBAction)swapButtonClicked:(id)sender {
    if ([self.departureButton.titleLabel.text isEqualToString: @"Departure Station"] || [self.arrivalButton.titleLabel.text isEqualToString:@"Arrival Station"]){
    }
    NSString *switchString = self.departureStation;
    self.departureStation = self.arrivalStation;
    self.arrivalStation = switchString;
    [self.departureButton setTitle:self.departureStation forState:UIControlStateNormal];
    [self.arrivalButton setTitle:self.arrivalStation forState:UIControlStateNormal];
}

-(NSArray*)generateDatesAroundCurrentDate{
    NSTimeInterval secondsPerDay = 24*60*60;
    NSMutableArray *dateArray = [[NSMutableArray alloc]initWithCapacity:7];
    for (int i=-3; i<3; i++) {
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:i*secondsPerDay];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM/dd/YYYY"];
        NSString *dateString = [formatter stringFromDate:date];
        [dateArray addObject:dateString];
    }
    return dateArray;
}

-(NSArray*)generateTimesFromCurrentTime{
    NSDate *currentDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:currentDate];
    NSInteger *hour = [components hour];
    NSInteger *minute = [components minute];
    if (minute/30<1){
        minute = 30;
    } else if (minute/30>1){
        hour = hour+1;
    }
    else {
        minute =30;
    }
    
    
    
    
    NSTimeInterval halfHour = 30*60;
    NSMutableArray *timeArray = [[NSMutableArray alloc]initWithCapacity:6];
    for (int i=0; i<5; i++){
        NSDate *date = [[NSDate alloc]initWithTimeIntervalSinceNow:i*halfHour];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"HH:mm"];
        NSString *timeString = [formatter stringFromDate:date];
        [timeArray addObject:timeString];
    }
    return timeArray;
}


- (IBAction)chooseDateClicked:(id)sender {
    NSArray *dateArray = [self generateDatesAroundCurrentDate];
    
    [MMPickerView showPickerViewInView:self.view
                           withStrings:dateArray
                           withOptions:nil
                            completion:^(NSString *selectedString) {
                                //selectedString is the return value which you can use as you wish
                                [self.chooseDateButton setTitle:selectedString forState:UIControlStateNormal];
                            }];

}

- (IBAction)chooseTimeClicked:(id)sender {
    NSArray *timeArray = [self generateTimesFromCurrentTime];
    
    [MMPickerView showPickerViewInView:self.view
                           withStrings:timeArray
                           withOptions:nil
                            completion:^(NSString *selectedString) {
                                //selectedString is the return value which you can use as you wish
                                [self.chooseTimeButton setTitle:selectedString forState:UIControlStateNormal];
                            }];

}
- (IBAction)goPressed:(id)sender {
}
 @end
