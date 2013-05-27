//
//  BSAppDelegate.h
//  Booker
//
//  Created by Brad Smith on 3/27/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpediaAPIClient.h"

#define theAppDelegate ((BSAppDelegate *)[UIApplication sharedApplication].delegate)

@interface BSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@property (strong, nonatomic) UITabBarController *tabController;

@property (strong, nonatomic) UISplitViewController *splitViewController;

@property (strong, nonatomic) NSMutableArray *mReservationArray;

@end
