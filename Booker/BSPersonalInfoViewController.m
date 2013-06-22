//
//  BSPersonalInfoViewController.m
//  Booker
//
//  Created by Brad Smith on 4/9/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "BSPersonalInfoViewController.h"
#import "ExpediaAPIClient.h"
#import "ExpediaBookingAPIClient.h"
#import "ExpediaBookingAPIClient.h"
#import "ChargableRateInfo.h"
#import "MBProgressHUD.h"

@interface BSPersonalInfoViewController ()

@end

@implementation BSPersonalInfoViewController

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
  [(UIScrollView *)self.view setContentSize:CGSizeMake(320, 1000)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButtonPressed:(id)sender {

  ChargableRateInfo *charageableRateInfo = [[self.roomRateDetail rateInfo] charageableRateInfo];
  
  NSLog(@"Hotel ID: %@",self.hotelSummary.hotelId);
  NSLog(@"arrivalDate: %@",self.arrivalDate);
  NSLog(@"departureDate: %@",self.departureDate);
  NSLog(@"supplierType: %@",self.hotelSummary.supplierType);
  NSLog(@"rateKey: %@",self.roomRateDetail.rateKey);
  NSLog(@"roomTypeCode: %@",self.roomRateDetail.roomTypeCode);
  NSLog(@"rateCode: %@",self.roomRateDetail.rateCode);
  
  NSDictionary *params = @{@"supplierType": self.hotelSummary.supplierType,
                           @"arrivalDate": self.arrivalDate,
                           @"departureDate":self.departureDate,
                           @"supplierType":self.hotelSummary.supplierType,
                           @"rateKey":self.roomRateDetail.rateKey,
                           @"roomTypeCode":self.roomRateDetail.roomTypeCode,
                           @"rateCode":self.roomRateDetail.rateCode,
                           @"hotelID":self.hotelSummary.hotelId,
                           
                           @"room1":@"1",
                           @"room1LastName":self.lastNameTextField.text,
                           @"room1FirstName":self.firstNameTextField.text,
                           
                           @"firstName":self.firstNameTextField.text,
                           @"lastName":self.lastNameTextField.text,
                           @"chargeableRate":charageableRateInfo.total,
                           
                           @"postalCode":self.postCodeTextField.text,
                           @"creditCardExpirationMonth":self.creditCardExpirationMonthTextField.text,
                           @"email":self.emailTextField.text,
                           @"creditCardType":self.creditCardTypeTextField.text,
                           @"creditCardNumber":self.creditCardNumberTextField.text,
                           
                           @"currencyCode":@"USD",
                           @"countryCode":self.countryTextField.text,
                           @"city":self.cityTextField.text,
                           
                           @"creditCardExpirationYear":self.creditCardExpirationYearTextField.text,
                           @"homePhone":self.phoneTextField.text,
                           @"stateProvinceCode":self.stateTextField.text,
                           @"workPhone":self.phoneTextField.text,
                           @"address1":self.addressTextField.text,
                           @"creditCardIdentifier":self.creditCardIdentifierTextField.text,
                           @"companyName":self.companyTextField.text
                           };
  
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = NSLocalizedString(@"LoadingLabel", nil);
  [[ExpediaBookingAPIClient sharedClient] performBookReservationWithParamaters:params
                                                                       success:^void(HotelRoomReservationResponse *hotelListResponse){NSLog(@"Booking Success Confirmation: %@",hotelListResponse.confirmationNumbers);
                                                                           [hud hide:YES];
                                                                         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hurray" message:@"Yor reservation has been booked" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                                                         [alert show];
                                                                       }
                                                                       failure:^void(NSError *error){
                                                                         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];[alert show];
                                                                         NSLog(@"Error %@",[error localizedDescription]);
                                                                           [hud hide:YES];
                                                                       }];
}
@end
