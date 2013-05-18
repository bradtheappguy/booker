//
//  NightlyRate.m
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "NightlyRate.h"

@implementation NightlyRate
-(id)initWithDictionary:(NSDictionary *)dictionary {
  if (!dictionary) {
    return self;
  }
  
  if (self = [super init]) {
    self.isPromo = [dictionary objectForKey:@"@promo"];
    self.rate = [dictionary objectForKey:@"@rate"];
    self.baseRate = [dictionary objectForKey:@"@baseRate"];
  }
  return self;
}
@end
