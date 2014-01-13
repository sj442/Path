//
//  AppDelegate.m
//  Pathapp
//
//  Created by Sunayna Jain on 11/5/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "AppDelegate.h"
#import "QueryManager.h"
#import "DataStore.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions

{
    [GMSServices provideAPIKey:@"AIzaSyB5Dx_ZWOeCl6H18Qsm5fRcdJHYtG1lWqM"];
    UINavigationController *controller = self.window.rootViewController;
    controller.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.56f blue:1.0f alpha:0.5f];
    
    //[[DataStore sharedStore] jsonParser];

    [[QueryManager sharedQueryManager] getTripsForDepartureStation:@"Exchange Place" andArrivalStation:@"Grove Street" andDepartAtTime:@"06:00:00" andArriveByTime:@"07:00:00" andDate:@"01/11/14"];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
