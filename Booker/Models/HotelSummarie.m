//
//  HotelSummaries.m
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelSummarie.h"

@implementation HotelSummarie
-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (!dictionary) {
    return nil;
  }
  if (self = [super init]) {
    self.tripAdvisorRating = [dictionary objectForKey:@"tripAdvisorRating"];
    self.order = [dictionary objectForKey:@"@order"];
    self.hotelId = [dictionary objectForKey:@"hotelId"];
    self.name = [dictionary objectForKey:@"name"];
    self.address1 = [dictionary objectForKey:@"address1"];
    self.city = [dictionary objectForKey:@"city"];
    self.stateProvinceCode = [dictionary objectForKey:@"stateProvinceCode"];
    self.countryCode = [dictionary objectForKey:@"countryCode"];
    self.postalCode = [dictionary objectForKey:@"postalCode"];
    self.airportCode = [dictionary objectForKey:@"airportCode"];
    self.supplierType = [dictionary objectForKey:@"supplierType"];
    self.propertyCategory = [dictionary objectForKey:@"propertyCategory"];
    self.hotelRating = [dictionary objectForKey:@"hotelRating"];
    self.confidenceRating = [dictionary objectForKey:@"confidenceRating"];
    self.amenityMask = [dictionary objectForKey:@"amenityMask"];
    self.shortDescription = [dictionary objectForKey:@"shortDescription"];
    self.locationDescription = [dictionary objectForKey:@"locationDescription"];
    self.lowRate = [dictionary objectForKey:@"lowRate"];
    self.highRate = [dictionary objectForKey:@"highRate"];
    self.rateCurrencyCode = [dictionary objectForKey:@"rateCurrencyCode"];
    self.latitude = [dictionary objectForKey:@"latitude"];
    self.longitude = [dictionary objectForKey:@"longitude"];
    self.proximityDistance = [dictionary objectForKey:@"proximityDistance"];
    self.proximityUnit = [dictionary objectForKey:@"proximityUnit"];
    self.hotelInDestination = [dictionary objectForKey:@"hotelInDestination"];
    self.thumbNailUrl = [dictionary objectForKey:@"thumbNailUrl"];
    self.deepLink = [dictionary objectForKey:@"deepLink"];
    
    NSArray *roomRateDetails = [[dictionary objectForKey:@"RoomRateDetailsList"] objectForKey:@"RoomRateDetails"];
    if ([roomRateDetails isKindOfClass:[NSDictionary class]]) {
      self.roomRateDetails = [[NSArray arrayWithObject:[[RoomRateDetail alloc] initWithDictionary:(NSDictionary *)roomRateDetails]] mutableCopy];
    }
    else if ([roomRateDetails count] > 0) {
      self.roomRateDetails = [[NSMutableArray alloc] initWithCapacity:[roomRateDetails count]];
      for (NSDictionary *d in roomRateDetails) {
        [self.roomRateDetails addObject:[[RoomRateDetail alloc] initWithDictionary:d]];
      }
    }
    
  }
  return self;
}
@end
