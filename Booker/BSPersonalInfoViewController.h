//
//  BSPersonalInfoViewController.h
//  Booker
//
//  Created by Brad Smith on 4/9/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelDetail.h"
#import "RoomRateDetail.h"
#import "RoomType.h"
#import "HotelSummarie.h"

@interface BSPersonalInfoViewController : UIViewController
@property (nonatomic) NSString *arrivalDate;
@property (nonatomic) NSString *departureDate;
@property (nonatomic) HotelSummarie *hotelSummary;
@property (nonatomic) RoomRateDetail *roomRateDetail;
@property (nonatomic) HotelDetail *hotelDetail;
@property (nonatomic) RoomType *roomType;


@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *postCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *creditCardTypeTextField;
@property (weak, nonatomic) IBOutlet UITextField *creditCardNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *creditCardExpirationMonthTextField;
@property (weak, nonatomic) IBOutlet UITextField *creditCardExpirationYearTextField;
@property (weak, nonatomic) IBOutlet UITextField *creditCardIdentifierTextField;

@end
