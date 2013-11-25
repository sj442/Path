//
//  DetailViewController.m
//  Pathapp
//
//  Created by Sachin Jindal on 11/19/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "DetailViewController.h"
#import "MapViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.route.legs count];
    NSLog(@"row count:%d", [self.route.legs count]);
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"routeInfo"];
    legInfo *currentLeg = ((legInfo*)self.route.legs[indexPath.row]);
    ((UILabel*)[cell viewWithTag:100]).text  = currentLeg.departureStop;
    
    //converting route hex color to rgb

    NSString *hexColor = currentLeg.legColor;
    NSUInteger red, green, blue;
    sscanf([hexColor UTF8String], "#%02X%02X%02X", &red, &green, &blue);
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
    ((UILabel*)[cell viewWithTag:101]).text  = currentLeg.TrainName;
    ((UILabel*)[cell viewWithTag:101]).textColor = color;
    ((UILabel*)[cell viewWithTag:102]).text  = currentLeg.arrivalStop;
    ((UIImageView*)[cell viewWithTag:103]).image = [UIImage imageNamed:@"trainTrack"];
    ((UILabel*)[cell viewWithTag:104]).text  = [NSString stringWithFormat:@"(%@-%@, %@ stops)", currentLeg.departureTime, currentLeg.arrivalTime, currentLeg.numberOfStops];
    
    return cell;
    
    }


- (IBAction)showMapClicked:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MapViewController *mvc = [storyboard instantiateViewControllerWithIdentifier:@"mapView"];
    mvc.route = self.route;
    
    [self.navigationController pushViewController:mvc animated:YES];
}
@end
