//
//  ReservationDetailViewController.m
//  Booker
//
//  Created by JinNan on 5/27/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "ReservationDetailViewController.h"
#import "ExpediaAPIClient.h"
#import "LocalDataModel.h"

@interface ReservationDetailViewController ()

@end

@implementation ReservationDetailViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated {
    NSDictionary *hotelInfoDic = (NSDictionary *)[[[LocalDataModel sharedLocalData] reservationArray] objectAtIndex:self.nIndex];
    
    self.checkinDateLabel.text = [hotelInfoDic objectForKey:@"arrivalDate"];
    self.checkoutDateLabel.text = [hotelInfoDic objectForKey:@"departureDate"];
    self.hotelNameLabel.text = [hotelInfoDic objectForKey:@"hotelName"];
    self.cityLabel.text = [hotelInfoDic objectForKey:@"hotelCity"];
    
    [self.hotelNameLabel sizeToFit];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCancelButtonClicked:(id)sender {

    //NSDictionary *hotelInfoDic = (NSDictionary *)[[[LocalDataModel sharedLocalData] reservationArray] objectAtIndex:self.nIndex];
    //NSNumber *itineraryId = [hotelInfoDic objectForKey:@"itineraryId"];
    //NSString *emailAddress = [hotelInfoDic objectForKey:@"email"];
    //NSString *confirmationNumbers  = [hotelInfoDic objectForKey:@"confirmationNumbers"];
    
//    [[ExpediaAPIClient sharedClient] performCancelReservationWithParamaters:@{@"itineraryId": itineraryId, @"email": @"brad@radiuymon.com", @"confirmationNumber": confirmationNumbers, }
//                                                            success:^(HotelRoomCancellationResponse *response){
//
//                                                            }
//                                                            failure:^(NSError *error){
//                                                                NSLog(@"Error: %@",[error localizedDescription]);
//                                                            }];
    
    [[LocalDataModel sharedLocalData] removeElementWithIndex:self.nIndex];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
