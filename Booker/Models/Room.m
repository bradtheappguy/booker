//
//  Room.m
//  Booker
//
//  Created by Brad Smith on 5/9/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "Room.h"

@implementation Room
-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.bedTypeId = [dictionary objectForKey:@"bedTypeId"];
    self.firstName = [dictionary objectForKey:@"firstName"];
    self.lastName = [dictionary objectForKey:@"lastName"];
    self.numberOfAdults = [dictionary objectForKey:@"numberOfAdults"];
    self.numberOfChildren = [dictionary objectForKey:@"numberOfChildren"];
    self.smokingPreference = [dictionary objectForKey:@"smokingPreference"];
  }
  return self;
}
@end
