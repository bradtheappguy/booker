//
//  RoomGroup.m
//  Booker
//
//  Created by Brad Smith on 5/9/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "RoomGroup.h"

@implementation RoomGroup

-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.room = [[Room alloc] initWithDictionary:[dictionary objectForKey:@"Room"]];
  }
  return self;
}
@end
