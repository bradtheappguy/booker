//
//  PingResponse.m
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "PingResponse.h"

@implementation PingResponse
-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.eanWsError = [[EanWsError alloc] initWithDictionery:[dictionary objectForKey:@"EanWsError"]];
    self.customerSessionId = [dictionary objectForKey:@"customerSessionId"];
    self.echo = [dictionary objectForKey:@"echo"];
  }
  return self;
}
@end
