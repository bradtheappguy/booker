//
//  LocationInfo.m
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "LocationInfo.h"

@implementation LocationInfo


-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (!dictionary) {
    return nil;
  }
  if (self = [super init]) {
    self.destinationId = [dictionary objectForKey:@"destinationId"];
    self.city = [dictionary objectForKey:@"city"];
    self.stateProvinceCode = [dictionary objectForKey:@"stateProvinceCode"];
    self.countryCode = [dictionary objectForKey:@"countryCode"];
    self.countryName = [dictionary objectForKey:@"countryName"];
    self.code = [dictionary objectForKey:@"code"];
    self.active = [dictionary objectForKey:@"active"];
    self.locationInDestination = [dictionary objectForKey:@"locationInDestination"];
    self.type = [dictionary objectForKey:@"type"];
    self.geoAccuracy = [dictionary objectForKey:@"geoAccuracy"];
    self.latitude = [dictionary objectForKey:@"latitude"];
    self.longitude = [dictionary objectForKey:@"longitude"];
    self.refLocationMilage = [dictionary objectForKey:@"refLocationMilage"];
    self.activePropertyCount = [dictionary objectForKey:@"activePropertyCount"];
  }
  return self;
}
@end
