//
//  Suppliers.m
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "Suppliers.h"

@implementation Suppliers

-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (dictionary == nil) {
    return nil;
  }
  else {
    self.chainCode = [dictionary objectForKey:@"@chainCode"];
    self.chainId = [dictionary objectForKey:@"@id"];
  }
  return self;
}
@end
