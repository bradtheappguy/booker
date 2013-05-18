//
//  HotelHeaderView.m
//  Booker
//
//  Created by Brad Smith on 4/6/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelHeaderView.h"
#import <AFNetworking/AFNetworking.h>

@implementation HotelHeaderView


-(void) setHotel:(HotelSummarie *)summary {
  /*
   @property (weak, nonatomic) IBOutlet UILabel *nameLabel;
   @property (weak, nonatomic) IBOutlet UILabel *starsAndReviewsLabel;
   @property (weak, nonatomic) IBOutlet UILabel *cityAndZipLabel;
   
   @property (weak, nonatomic) IBOutlet UIImageView *imageView;
   @property (weak, nonatomic) IBOutlet UILabel *addressLine1Label;
   @property (weak, nonatomic) IBOutlet UILabel *locationDescriptionLabel;
   */
  
  //Tumbnail
  NSString *urlString = [NSString stringWithFormat:@"http://images.travelnow.com/%@",[summary thumbNailUrl]];
  urlString = [urlString stringByReplacingOccurrencesOfString:@"_t." withString:@"_b."];
  [self.imageView setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:nil];
  
  //Name
  self.hotelNameLabel.text = [summary name];
  
  //Price
 
  
  //Location
  self.cityAndZipLabel.text = [NSString stringWithFormat:@"%@, %@",summary.city,summary.postalCode];
  
  
  self.locationDescriptionLabel.text = [summary locationDescription];
  //Stars and Reviews
  NSNumber *rating = [summary hotelRating];
  NSNumber *ttripAdvisorRating = [summary tripAdvisorRating];
  self.starsAndReviewsLabel.text = [NSString stringWithFormat:@"%d stars (%d trip advisor)",[rating integerValue],[ttripAdvisorRating integerValue]];
  

  
}

@end
