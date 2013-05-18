//
//  HotelCell.h
//  Booker
//
//  Created by Brad Smith on 3/31/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *hotelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsAndReviewsLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityAndZipLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationDescriptionLabel;

@end
