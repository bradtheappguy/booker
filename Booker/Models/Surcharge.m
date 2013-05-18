//
//  Surcharge.m
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "Surcharge.h"

@implementation Surcharge

-(id)initWithDictionary:(NSDictionary *)dictionary {
  if (!dictionary) {
    return self;
  }
    
  if (self = [super init]) {
    self.amount = [dictionary objectForKey:@"@amount"];
    self.type = [dictionary objectForKey:@"@type"];
  }
  return self;
}

@end
