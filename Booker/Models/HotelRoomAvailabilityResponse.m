//
//  HotelRoomAvailabilityResponse.m
//  Booker
//
//  Created by Brad Smith on 5/8/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelRoomAvailabilityResponse.h"

@implementation HotelRoomAvailabilityResponse
-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.eanWsError = [[EanWsError alloc] initWithDictionery:[dictionary objectForKey:@"EanWsError"]];
    self.customerSessionId = [dictionary objectForKey:@"customerSessionId"];
 //TODO
      
  }
  return self;
}
@end
