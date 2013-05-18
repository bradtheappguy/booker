//
//  HotelListResponse.m
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelListResponse.h"
#import "HotelSummarie.h"

@implementation HotelListResponse
-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.eanWsError = [[EanWsError alloc] initWithDictionery:[dictionary objectForKey:@"EanWsError"]];
    self.customerSessionId = [dictionary objectForKey:@"customerSessionId"];
    self.moreResultsAvailable = [dictionary objectForKey:@"moreResultsAvailable"];
    self.numberOfRoomsRequested = [dictionary objectForKey:@"numberOfRoomsRequested"];
    self.cacheKey = [dictionary objectForKey:@"cacheKey"];
    self.cacheLocation = [dictionary objectForKey:@"cacheLocation"];
    
    NSArray *hotelSummaries = [[dictionary objectForKey:@"HotelList"] objectForKey:@"HotelSummary"];
    self.hotelSummaries = [[NSMutableArray alloc] initWithCapacity:hotelSummaries.count];
    for (NSDictionary *dict in hotelSummaries) {
      [self.hotelSummaries addObject:[[HotelSummarie alloc] initWithDictionary:dict]];
    }
    
  }
  return self;
}
@end
