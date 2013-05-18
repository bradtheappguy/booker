//
//  RoomRateDetail.m
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "RoomRateDetail.h"


@implementation RoomRateDetail
-(id)initWithDictionary:(NSDictionary *)dictionary {
  if (!dictionary) {
    return self;
  }
  
  if (self = [super init]) {
    self.roomTypeCode = [dictionary objectForKey:@"roomTypeCode"];
    self.rateCode = [dictionary objectForKey:@"rateCode"];
    self.maxRoomOccupancy = [dictionary objectForKey:@"maxRoomOccupancy"];
    self.quotedRoomOccupancy = [dictionary objectForKey:@"quotedRoomOccupancy"];
    self.minGuestAge = [dictionary objectForKey:@"minGuestAge"];
    self.roomDescription = [dictionary objectForKey:@"roomDescription"];
    self.promoId = [dictionary objectForKey:@"promoId"];
    self.promoDescription = [dictionary objectForKey:@"promoDescription"];
    self.promoDetailText = [dictionary objectForKey:@"promoDetailText"];
    self.currentAllotment = [dictionary objectForKey:@"currentAllotment"];
    self.propertyAvailable = [dictionary objectForKey:@"propertyAvailable"];
    self.propertyRestricted = [dictionary objectForKey:@"propertyRestricted"];
    self.expediaPropertyId = [dictionary objectForKey:@"expediaPropertyId"];
    
    self.rateKey = [dictionary objectForKey:@"rateKey"];
    
    self.valueAds = [[NSMutableArray alloc] init];
    
    id value = [[dictionary objectForKey:@"ValueAdds"] objectForKey:@"ValueAdd"];
    if ([value isKindOfClass:[NSDictionary class]]) {
      [self.valueAds addObject:[value objectForKey:@"description"]];
    }
    else if ([value isKindOfClass:[NSArray class]]){
      for (NSDictionary *x in value) {
        [self.valueAds addObject:[x objectForKey:@"description"]];
      }
    }
    
    
    self.rateInfo = [[RateInfo alloc] initWithDictionary:[dictionary objectForKey:@"RateInfo"]];
    
    
  }
  return self;
}

@end
