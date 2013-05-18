//
//  RateInfo.m
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "RateInfo.h"

@implementation RateInfo

-(id)initWithDictionary:(NSDictionary *)dictionary {
  if (!dictionary) {
    return self;
  }
  
  if (self = [super init]) {
    self.rateCharge = [dictionary objectForKey:@"@rateCharge"];
    self.promo = [dictionary objectForKey:@"@promo"];
    self.priceBreakdown = [dictionary objectForKey:@"@priceBreaksdown"];
    
    self.charageableRateInfo = [[ChargableRateInfo alloc] initWithDictionary:[dictionary objectForKey:@"ChargeableRateInfo"]];
      
    
  }
  return self;
}


@end
