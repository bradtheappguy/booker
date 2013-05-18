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
                           @"room1BedTypeId":@"21",
                           
                           @"firstName":self.firstNameTextField.text,
                           @"lastName":self.lastNameTextField.text,
                           @"chargeableRate":charageableRateInfo.total,
                           
                           @"postalCode":self.postCodeTextField.text,
                           @"creditCardExpirationMonth":@"5",
                           @"email":self.emailTextField.text,
                           @"creditCardType":@"VI",
                           @"creditCardNumber":@"4111111111111111",
                           
                           
                          //                           affiliateConfirmationId	36ABD990-16F7-4ABA-ACD1-D9F3932D0BA4-15958-00003AF84F43E026
                           @"currencyCode":@"USD",
                           @"countryCode":self.countryTextField.text,
                           @"city":self.cityTextField.text,
                           //affiliateCustomerId	cebfbd3721d85afac353ee0474a17833
                           //cid	367151
                           @"creditCardExpirationYear":@"2013",
                           @"homePhone":self.phoneTextField.text,
                           @"stateProvinceCode":self.stateTextField.text,
                           @"workPhone":self.phoneTextField.text,
                           @"address1":self.addressTextField.text,
                           @"creditCardIdentifier":@"123",
                           @"companyName":self.companyTextField.text
                           };
  
  [[ExpediaBookingAPIClient sharedClient] performBookReservationWithParamaters:params
                                                                       success:^void(HotelRoomReservationResponse *hotelListResponse){NSLog(@"Booking Success Confirmation: %@",hotelListResponse.confirmationNumbers);}
                                                                       failure:^void(NSError *error){
                                                                         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];[alert show];
                                                                         NSLog(@"Error %@",[error localizedDescription]); }];
}
@end
