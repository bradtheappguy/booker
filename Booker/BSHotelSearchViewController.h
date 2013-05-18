//
//  BSHotelSearchViewController.h
//  Booker
//
//  Created by Brad Smith on 3/27/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSHotelSearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkinTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkoutTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfAdultsTextField;
@property (weak, nonatomic) IBOutlet UITextField *kidsTextField;

@property (weak, nonatomic) IBOutlet UIButton *searchHotelsButton;

- (IBAction)searchHotelsButtonPressed:(UIButton *)sender;

@end
