//
//  DataStore.h
//  Pathapp
//
//  Created by Sunayna Jain on 11/6/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SBJson.h>
#import <CoreData/CoreData.h>

extern const NSString *filepath;

@interface DataStore : NSObject <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSFetchedResultsController *stopsFetchedResultsController;

@property (strong, nonatomic) NSFetchedResultsController *routesFetchedResultsController;

@property (strong, nonatomic) NSFetchedResultsController *stopTimesFetchedResultsController;

@property (strong, nonatomic) NSFetchedResultsController *weekServiceFetchedResultsController;

@property (strong, nonatomic) NSFetchedResultsController *tripsFetchedResultsController;


+(DataStore*)sharedStore;

-(void)jsonParser;


@end
