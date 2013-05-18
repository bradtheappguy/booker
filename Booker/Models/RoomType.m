//
//  RoomType.m
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "RoomType.h"
#import "Amenity.h"

/*
 
 @property (nonatomic) NSNumber *roomCode;
 @property (nonatomic) NSNumber *roomTypeId;
 @property (nonatomic) NSString *description;
 @property (nonatomic) NSString *descriptionLong;
 @property (nonatomic) NSArray *roomAmenities;
*/


@implementation RoomType

-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (dictionary == nil) {
    return nil;
  }
  else {
    if (self = [super init]) {
      self.roomCode = [dictionary objectForKey:@"@roomCode"];
      self.roomTypeId = [dictionary objectForKey:@"@roomTypeId"];
      self.description = [dictionary objectForKey:@"description"];
      self.descriptionLong = [dictionary objectForKey:@"descriptionLong"];
      
      NSArray *roomAmenities = [[dictionary objectForKey:@"roomAmenities"] objectForKey:@"RoomAmenity"];
      if ([roomAmenities isKindOfClass:[NSArray class]]) {
        self.roomAmenities = [[NSMutableArray alloc] initWithCapacity:[roomAmenities count]];
        for (NSDictionary *amenity in roomAmenities) {
          [self.roomAmenities addObject:[[Amenity alloc] initWithDictionary:amenity]];
        }
      }
      else if ([roomAmenities isKindOfClass:[NSDictionary class]]) {
        self.roomAmenities = [[NSMutableArray alloc] initWithObjects:roomAmenities, nil];
      }

      
    }
  }
  return self;
}

@end
