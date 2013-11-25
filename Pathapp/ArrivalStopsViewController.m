//
//  AllStopsViewController.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/8/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "ArrivalStopsViewController.h"

@interface ArrivalStopsViewController ()

@end

@implementation ArrivalStopsViewController

@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.stopsArray = [[NSArray alloc]initWithObjects:@"Hoboken", @"Newport", @"Newark Penn Station", @"Harrison", @"Journal Square", @"Exchange Place", @"Grove Street", @"World Trade Center", @"Christopher Street", @"9th Street", @"14th Street", @"23rd Street", @"33rd Street", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.stopsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.stopsArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *itemToPassBack = [self.stopsArray objectAtIndex:indexPath.row];
    NSLog(@"selected item:%@", itemToPassBack);
    [self.delegate addItemsViewController:self didFinishEnteringItem:itemToPassBack];
    [self dismissViewControllerAnimated:YES completion:nil];

}




@end
