//
//  PropertyAmenity.m
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "Amenity.h"

@implementation Amenity

-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (dictionary == nil) {
    return nil;
  }
  else {
    if (self = [super init]) {
      self.amenity = [dictionary objectForKey:@"amenity"];
      self.amenityId = [dictionary objectForKey:@"amenityId"];
      if (!self.amenityId) {
        self.amenityId = [dictionary objectForKey:@"@amenityId"];
      }
    }
  }
  return self;
}
@end
