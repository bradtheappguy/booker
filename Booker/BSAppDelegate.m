//
//  BSAppDelegate.m
//  Booker
//
//  Created by Brad Smith on 3/27/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "BSAppDelegate.h"

#import "BSMasterViewController.h"
#import "BSDetailViewController.h"
#import "BSHotelSearchViewController.h"
#import "ExpediaBookingAPIClient.h"
#import "ReservationsViewController.h"

@implementation BSAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  [[ExpediaAPIClient sharedClient] setApiKey:@"jepwcpwk4mqtafd38ragk59q"];
  [[ExpediaAPIClient sharedClient] setApiSecret:@"ZmJxPMr9"];
  [[ExpediaBookingAPIClient sharedClient] setApiKey:@"jepwcpwk4mqtafd38ragk59q"];
  [[ExpediaBookingAPIClient sharedClient] setApiSecret:@"ZmJxPMr9"];
  
  [[ExpediaAPIClient sharedClient] performGeoSearchWithParamaters:@{@"destinationString": @"London", @"ignoreSearchWeight": @"true"}
                                                          success:^(NSArray *locationinfos) {
                                                            NSLog(@"%@",locationinfos);
                                                          }
                                                          failure:^(NSError *error){
                                                            NSLog(@"%@",[error localizedDescription]);
                                                          }];
  
  [[ExpediaAPIClient sharedClient] performPingWithParamaters:@{@"echo": @"foo"}
                                                          success:^(PingResponse  *pingResponse) {
                                                            NSLog(@"%@",pingResponse);
                                                          }
                                                          failure:^(NSError *error){
                                                            NSLog(@"%@",[error localizedDescription]);
                                                          }];
  
  [[ExpediaAPIClient sharedClient] performHotelListWithParamaters:@{@"destinationId": @"3D931ACE-E3FE-46B4-A243-61D44A22053B",
                                                                    @"includeDetails": @"true",
                                                                    @"numberOfResults": @"50",
                                                                    @"arrivalDate": @"05/10/13",
                                                                    @"departureDate": @"05/12/13",
                                                                    @"room1": @"1", 
                                                                    @"maxRatePlanCount": @"10"} //TODO make this work w/ one
                                                     success:^(HotelListResponse  *pingResponse) {
                                                       NSLog(@"%@",pingResponse);
                                                     }
                                                     failure:^(NSError *error){
                                                       NSLog(@"%@",[error localizedDescription]);
                                                     }];
  
  [[ExpediaAPIClient sharedClient] performHotelInfoWithParamaters:@{@"hotelId": @"123447"}
                                                          success:^(HotelInformationResponse  *pingResponse) {
                                                            NSLog(@"%@",pingResponse);
                                                          }
                                                          failure:^(NSError *error){
                                                            NSLog(@"%@",[error localizedDescription]);
                                                          }];
  

     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  

  // Override point for customization after application launch.
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {

      BSHotelSearchViewController *masterViewController = [[BSHotelSearchViewController alloc] initWithNibName:@"BSHotelSearchViewController" bundle:nil];
      UINavigationController *searchNavController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
      searchNavController.navigationBar.hidden = YES;

      ReservationsViewController *reservationVC = [[ReservationsViewController alloc] initWithNibName:@"ReservationsViewController" bundle:nil];
      UINavigationController *reservationNavController = [[UINavigationController alloc] initWithRootViewController:reservationVC];
      reservationNavController.navigationBar.hidden = YES;
      
      NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:searchNavController, reservationNavController, nil];
      
      self.tabController = [[UITabBarController alloc] init];
      [self.tabController setViewControllers:viewControllersArray animated:YES];
      self.window.rootViewController = self.tabController;

      //masterViewController.managedObjectContext = self.managedObjectContext;
  } else {
      BSMasterViewController *masterViewController = [[BSMasterViewController alloc] initWithNibName:@"BSMasterViewController_iPad" bundle:nil];
      UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
      
      BSDetailViewController *detailViewController = [[BSDetailViewController alloc] initWithNibName:@"BSDetailViewController_iPad" bundle:nil];
      UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
  	
      masterViewController.detailViewController = detailViewController;
      
      self.splitViewController = [[UISplitViewController alloc] init];
      self.splitViewController.delegate = detailViewController;
      self.splitViewController.viewControllers = @[masterNavigationController, detailNavigationController];
      
      self.window.rootViewController = self.splitViewController;
      masterViewController.managedObjectContext = self.managedObjectContext;
  }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Saves changes in the application's managed object context before the application terminates.
  [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Booker" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Booker.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
