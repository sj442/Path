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

@interface ViewController ()

@property (strong, nonatomic) NSArray *stopsArray;



@end

@implementation ViewController




- (void)viewDidLoad

{
    
    [super viewDidLoad];
    
    
    [[DataStore sharedStore] jsonParser];
    
    self.datePickerView.hidden= YES;
    
    self.timePickerView.hidden = YES;
    
    [self.departureButton setTitle:@"Departure Station" forState:UIControlStateNormal];
    
    [self.arrivalButton setTitle:@"Arrival Station" forState:UIControlStateNormal];
    
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
    
    if (self.dateChosen !=nil){
        
        [self.dateButton setTitle: [NSString stringWithFormat:@"%@",dateChosenString] forState:UIControlStateNormal];
    } else {
        
        [self.dateButton setTitle:defaultDateString forState:UIControlStateNormal];
    }
    
    NSLog(@"current date:%@", defaultDateString);

    NSLog(@"departure station:%@", self.departureStation);
    
    NSLog(@"arrival Station:%@", self.rrivalStation);
    
}



-(NSNumber*)convertOriginToOriginLatitude {
    
    NSNumber *lat =  [[APIStore sharedAPIStore] getLatitudeForStop:self.departureStation];
    
    //NSLog(@"origin lat:%@", lat);
    
    return lat;
}

-(NSNumber*)convertOriginToOriginLongitude {
    
    NSNumber *lon =  [[APIStore sharedAPIStore] getLongitudeForStop:self.departureStation];
    //NSLog(@"origin lon:%@", lon);
    
    return lon;
}

-(NSNumber*)convertDestinationToDestinationLatitude {
    
NSNumber *lat =  [[APIStore sharedAPIStore] getLatitudeForStop:self.rrivalStation];
    //NSLog(@"destination lat:%@", lat);
    return lat;
}

-(NSNumber*)convertDestinationToDestinationLongitude {
    
NSNumber *lon =  [[APIStore sharedAPIStore] getLongitudeForStop:self.rrivalStation];
    //NSLog(@"destination lon:%@", lon);
    return lon;
}


#pragma mark- datePickerMethods

- (IBAction)DatePressed:(id)sender {
    self.datePickerView.hidden = NO;
    NSArray *viewArray = self.datePickerView.subviews;
    NSLog(@"first object:%@", [viewArray firstObject] );
}

- (IBAction)TimePressed:(id)sender {
    
    self.timePickerView.hidden = NO;
    NSArray *viewArray = self.timePickerView.subviews;
    NSLog(@"first object:%@", [viewArray firstObject] );
    self.timePickerView.hidden = NO;
}

- (IBAction)donePressed:(id)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"dd MMM yy"];
    
    NSString *dateString = [formatter stringFromDate:((UIDatePicker*)[self.datePickerView.subviews firstObject]).date];
    
    self.dateChosen = ((UIDatePicker*)[self.datePickerView.subviews firstObject]).date;
    
    self.dateButton.titleLabel.text = dateString;
    
    self.datePickerView.hidden = YES;
    
    NSLog(@"date is:%@", dateString);
}

-(void)configureDatePicker{
    
    ((UIDatePicker*)[self.datePickerView.subviews firstObject]).datePickerMode = UIDatePickerModeDate;
}

- (IBAction)cancelPressed:(id)sender {
    
    self.datePickerView.hidden = YES;
}

#pragma mark- timepickermethods

- (IBAction)timePickerDonePressed:(id)sender {
    self.timeChosen = ((UIDatePicker*)[self.timePickerView.subviews firstObject]).date;
    self.timePickerView.hidden = YES;
    NSLog(@"time chosen:%@", self.timeChosen);
}

- (IBAction)timePickerCancelPressed:(id)sender {
    self.timePickerView.hidden = YES;
}

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


- (IBAction)departureButtonPresses:(id)sender {
    
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

- (IBAction)GoPressed:(id)sender {

    NSDate *referenceDate = [NSDate dateWithTimeIntervalSince1970:0];
    
    NSTimeInterval timeInterval = [self.dateChosen timeIntervalSinceNow];
    
    NSTimeInterval referenceTimeInterval = [referenceDate timeIntervalSinceNow];
    
    NSTimeInterval diff = timeInterval-referenceTimeInterval;
    
    self.timeInterval = [NSNumber numberWithInteger:round(diff)];
    
    NSLog(@"time in seconds:%f", diff);
    
    [[APIStore sharedAPIStore] getdirectionsForOriginLat:[self convertOriginToOriginLatitude] originLon:[self convertOriginToOriginLongitude] destinationLat: [self convertDestinationToDestinationLatitude] destinationLog:[self convertDestinationToDestinationLongitude] andDepartureTime:self.timeInterval withCompletion:^(NSArray *routeArray) {
        NSLog(@"route count:%d",[routeArray count]);
        
        [self performSegueWithIdentifier:@"tripsList" sender:(id) sender];
    }];
}

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
    
    self.rrivalStation = [[NSString alloc]initWithString:returnItem];
    
    NSLog(@"%@", self.rrivalStation);
        
    [self.arrivalButton setTitle:self.rrivalStation forState:UIControlStateNormal];
    
    NSLog(@"got here");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //if ([[segue identifier] isEqualToString:@"tripsList"]){
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    TripsListviewController *tlvc = [storyboard instantiateViewControllerWithIdentifier:@"tripsList"];
        
        tlvc = [segue destinationViewController];
    }
    
 @end
