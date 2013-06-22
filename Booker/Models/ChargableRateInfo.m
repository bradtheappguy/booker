//
//  ChargableRateInfo.m
//  Booker
//
//  Created by Brad Smith on 3/30/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "ChargableRateInfo.h"
#import "NightlyRate.h"
#import "Surcharge.h"


@implementation ChargableRateInfo

-(id)initWithDictionary:(NSDictionary *)dictionary {
  if (!dictionary) {
    return self;
  }
  
  if (self = [super init]) {
    self.total = [dictionary objectForKey:@"@total"];
    self.surchargeTotal = [dictionary objectForKey:@"@surchargeTotal"];
    self.nightlyRateTotal = [dictionary objectForKey:@"@nightlyRateTotal"];
    self.maxNightlyRate = [dictionary objectForKey:@"@maxNightlyRate"];
    self.currencyCode = [dictionary objectForKey:@"@currencyCode"];
    self.commissionableUsdTotal = [dictionary objectForKey:@"@commissionableUsdTotal"];
    self.averageRate = [dictionary objectForKey:@"@averageRate"];
    self.averageBaseRate = [dictionary objectForKey:@"@averageBaseRate"];
    
    NSArray *nightlyRates = [[dictionary objectForKey:@"NightlyRatesPerRoom"] objectForKey:@"NightlyRate"];
    if ([nightlyRates count] > 0) {
      self.nightlyRates = [[NSMutableArray alloc] initWithCapacity:[nightlyRates count]];
      for (NSDictionary *r in nightlyRates) {
        [self.nightlyRates addObject:[[NightlyRate alloc] initWithDictionary:r]];
      }
    }
    
    NSArray *surcharges = [[dictionary objectForKey:@"Surcharges"] objectForKey:@"Surcharge"];
    if ([surcharges isKindOfClass:[NSDictionary class]]) {
      self.surcharges = [[NSArray arrayWithObject:[[Surcharge alloc] initWithDictionary:(NSDictionary *)surcharges]] mutableCopy];
    }
    else if ([surcharges count] > 0) {
      self.surcharges = [[NSMutableArray alloc] initWithCapacity:[surcharges count]];
      for (NSDictionary *r in surcharges) {
        [self.nightlyRates addObject:[[Surcharge alloc] initWithDictionary:r]];
      }
    }
    
    
    
  }
  return self;
}

@end
