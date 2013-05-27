//
//  ReservationDetailViewController.h
//  Booker
//
//  Created by JinNan on 5/27/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReservationDetailViewController : UIViewController

@property (readwrite, nonatomic) int nIndex;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UILabel *checkinDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *checkoutDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *hotelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

- (IBAction)onCancelButtonClicked:(id)sender;

@end
