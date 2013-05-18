//
//  LocationInfoResponse.m
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "LocationInfoResponse.h"
#import "LocationInfo.m"

@implementation LocationInfoResponse

-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.eanWsError = [[EanWsError alloc] initWithDictionery:[dictionary objectForKey:@"EanWsError"]];
    self.customerSessionId = [dictionary objectForKey:@"customerSessionId"];
    
    NSArray *infos = [[dictionary objectForKey:@"LocationInfos"] objectForKey:@"LocationInfo"];
    if (infos) {
      self.locationInfos = [[NSMutableArray alloc] initWithCapacity:infos.count];
    }
    if ([infos isKindOfClass:[NSDictionary class]]) {
      infos = [NSArray arrayWithObject:infos];
    }
    for (NSDictionary *info in infos) {
      LocationInfo *location = [[LocationInfo alloc] initWithDictionary:info];
      [self.locationInfos addObject:location];
    }
    
  }
  return self;
}
@end
