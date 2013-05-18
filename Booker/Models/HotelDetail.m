//
//  HotelDetail.m
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelDetail.h"

@implementation HotelDetail

-(id)initWithDictionary:(NSDictionary *)dictionary {
  if (dictionary == nil) {
    return nil;
  }
  else {
    if (self = [super init]) {
      self.areaInformation = [dictionary objectForKey:@"areaInformation"];
      self.checkInTime = [dictionary objectForKey:@"checkInTime"];
      self.drivingDirections = [dictionary objectForKey:@"drivingDirections"];
      self.hotelPolicy = [dictionary objectForKey:@"hotelPolicy"];
      self.numberOfFloors = [dictionary objectForKey:@"numberOfFloors"];
      self.numberOfRooms = [dictionary objectForKey:@"numberOfRooms"];
      self.propertyDescription = [dictionary objectForKey:@"propertyDescription"];
      self.propertyInformation = [dictionary objectForKey:@"propertyInformation"];
      self.roomInformation = [dictionary objectForKey:@"roomInformation"];
      self.checkInInstructions = [dictionary objectForKey:@"checkInInstructions"];
    }
  }
  return self;
}
@end
