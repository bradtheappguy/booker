//
//  BSHotelSearchViewController.m
//  Booker
//
//  Created by Brad Smith on 3/27/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "BSHotelSearchViewController.h"
#import "ExpediaAPIClient.h"
#import "HotelListViewController.h"
#import "MBProgressHUD.h"

@interface BSHotelSearchViewController ()

@end

@implementation BSHotelSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
        self.tabBarItem.title = @"Search";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationTextField.text = @"San Francsico";
  self.numberOfAdultsTextField.text = @"1";
  self.kidsTextField.text = @"1";
  self.checkinTextField.text = @"05/28/14";
  self.checkoutTextField.text = @"05/30/14";
  
}

-(void) viewWillAppear:(BOOL)animated {
  [self.navigationController setNavigationBarHidden:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchHotelsButtonPressed:(UIButton *)sender {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = NSLocalizedString(@"LoadingLabel", nil);
  [[ExpediaAPIClient sharedClient] performHotelListWithParamaters:@{@"destinationString": self.locationTextField.text,
                                                                    @"arrivalDate": self.checkinTextField.text,
                                                                    @"departureDate": self.checkoutTextField.text,
                                                                    @"numberOfResults": @"50",
                                                                    @"room1": @"1",
                                                                    @"includeDetails": @"true",
                                                                    @"maxRatePlanCount": @"14"}
                                                          success:^(HotelListResponse *response){
                                                            HotelListViewController *vc = [[HotelListViewController alloc] initWithNibName:nil bundle:nil];
                                                            vc.arrivalDate = self.checkinTextField.text;
                                                            vc.departureDate = self.checkoutTextField.text;
                                                            vc.hotels = [response hotelSummaries];
                                                            [self.navigationController pushViewController:vc animated:YES];
                                                            NSLog(@"GOT");
                                                              [hud hide:YES];
                                                          }
                                                          failure:^(NSError *error){
                                                            NSString *localizedErrorDescription = [error localizedDescription];
                                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:localizedErrorDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                            [alert show];
                                                            NSLog(@"Error: %@",localizedErrorDescription);
                                                              [hud hide:YES];
                                                          }];
}
@end
