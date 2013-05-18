//
//  RoomRateCell.m
//  Booker
//
//  Created by Brad Smith on 4/6/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "RoomRateCell.h"

@implementation RoomRateCell

-(void) setRoomRateDetails:(RoomRateDetail *)roomRateDetail {
  self.roomDescriptionLabel.text = roomRateDetail.roomDescription;
  
  RateInfo *rateInfo = [roomRateDetail rateInfo];
  ChargableRateInfo *chargableRateInfo =  [rateInfo charageableRateInfo];
  self.priceLabel.text =  [chargableRateInfo averageBaseRate];
  
  self.line1.text = @"";
  self.line2.text = @"";
  self.line3.text = @"";
  self.line4.text = @"";
  
  self.line1.text = [roomRateDetail promoDescription];
  
  
  if ([[roomRateDetail valueAds] count] > 0) {
    self.line2.text = [[roomRateDetail valueAds] objectAtIndex:0];
  }
  if ([[roomRateDetail valueAds] count] > 1) {
    self.line3.text = [[roomRateDetail valueAds] objectAtIndex:1];
  }
  if ([[roomRateDetail valueAds] count] > 2) {
    self.line4.text = [[roomRateDetail valueAds] objectAtIndex:2];
  }
  
  NSUInteger currentAlotment = [[roomRateDetail currentAllotment] integerValue];
  if (currentAlotment < 10) {
    self.line5.text = [NSString stringWithFormat:@"%d rooms left",currentAlotment];
  }

}

@end
