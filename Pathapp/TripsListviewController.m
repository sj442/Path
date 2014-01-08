//
//  TripsListviewController.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "TripsListviewController.h"
#import "DetailViewController.h"

@interface TripsListviewController ()

@property (strong, nonatomic) APIStore *mystore;

@end

@implementation TripsListviewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.mystore = [APIStore sharedAPIStore];
    
    if ([self.mystore.routesArray count] ==0){
        UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"Sorry, we couldn't find any routes. Please modify your search" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertview show];
    }
    
    //NSLog(@"table view displayed!");
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex ==0){
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

#pragma mark-TableViewMethods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[APIStore sharedAPIStore].routesArray count];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tripsCell" forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tripsCell"];
    }
    
    NSString *departTime = [((RouteInfo*)[[APIStore sharedAPIStore].routesArray objectAtIndex:indexPath.row]) getRouteStartTime];
    
    NSLog(@"depart time:%@", departTime);
    
    NSString *arrivalTime = [((RouteInfo*)[[APIStore sharedAPIStore].routesArray objectAtIndex:indexPath.row]) getRouteEndTime];
    
    NSLog(@"arrival time:%@", arrivalTime);
    
    ((UILabel*)[cell viewWithTag:100]).text = [NSString stringWithFormat:@"%@-%@", departTime,arrivalTime];
    
    RouteInfo * curRoute = ((RouteInfo*)[APIStore sharedAPIStore].routesArray[indexPath.row]);
    NSArray *transfersArray = [curRoute getTransferStops];
    
    NSString *transferText = @"";
    
    if ([transfersArray count] > 0) {
        transferText = [transferText stringByAppendingString:@"via "];
        int cur_index = 1;
        int total_transfers = [transfersArray count];
        for (NSString* transferStop in transfersArray) {
            transferText = [transferText stringByAppendingString:transferStop];
            if (cur_index < total_transfers) {
              transferText = [transferText stringByAppendingString:@","];
            }
            transferText = [transferText stringByAppendingString:@" "];
        }
    }
    
    int duration_mins = [curRoute duration_secs] / 60;
    int duration_hrs = duration_mins / 60;
    NSString *durationText;
    if (duration_hrs  > 0) {
        duration_mins -= duration_hrs * 60;
        durationText = [NSString stringWithFormat:@"%d h  %d m", duration_hrs, duration_mins];
    } else {
        durationText = [NSString stringWithFormat:@"%d m", duration_mins];
    }

    ((UILabel*)[cell viewWithTag:101]).text = durationText;
    
    NSLog(@"transfer text is %@, durationText is %@", transferText, durationText);
    ((UILabel*)[cell viewWithTag:102]).text = transferText;

    //NSLog(@"departure time:@%@", ((legInfo*)[[APIStore sharedAPIStore].routesArray objectAtIndex:indexPath.row]).departureTime);
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    DetailViewController *dvc = [storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    
    dvc.route = ((RouteInfo*)[APIStore sharedAPIStore].routesArray[indexPath.row]);
    
    [self.navigationController pushViewController:dvc animated:YES];
    
}
@end
