//
//  HotelHeaderView.h
//  Booker
//
//  Created by Brad Smith on 4/6/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelSummarie.h"

@interface HotelHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *hotelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsAndReviewsLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityAndZipLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLine1Label;
@property (weak, nonatomic) IBOutlet UILabel *locationDescriptionLabel;

-(void) setHotel:(HotelSummarie *)hotelSummary;
@end
