//
//  HotelImage.m
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelImage.h"

@implementation HotelImage

-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (dictionary == nil) {
    return nil;
  }
  if (self = [super init]) {
    self.byteSize = [dictionary objectForKey:@"byteSize"];
    self.category = [dictionary objectForKey:@"category"];
    self.caption = [dictionary objectForKey:@"caption"];
    self.height = [dictionary objectForKey:@"height"];
    self.hotelImageId = [dictionary objectForKey:@"hotelImageId"];
    self.name = [dictionary objectForKey:@"name"];
    self.supplierId = [dictionary objectForKey:@"supplierId"];
    self.thumbnailUrl = [dictionary objectForKey:@"thumbnailUrl"];
    self.type = [dictionary objectForKey:@"type"];
    self.URL = [dictionary objectForKey:@"url"];
    self.width = [dictionary objectForKey:@"width"];
  }
  return self;
}
@end
