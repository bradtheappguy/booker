//
//  HotelInformationResponse.m
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelInformationResponse.h"
#import "Amenity.h"
#import "HotelImage.h"
#import "RoomType.h"
#import "Suppliers.h"

@implementation HotelInformationResponse
-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
     self.eanWsError = [[EanWsError alloc] initWithDictionery:[dictionary objectForKey:@"EanWsError"]];
     self.customerSessionId = [dictionary objectForKey:@"customerSessionId"];
    self.hotelId = [dictionary objectForKey:@"@hotelId"];
    
    self.hotelSummary = [[HotelSummarie alloc] initWithDictionary:[dictionary objectForKey:@"HotelSummary"]];
    
    
    
    NSArray *propertyAmenities = [[dictionary objectForKey:@"PropertyAmenities"] objectForKey:@"PropertyAmenity"];
    if ([propertyAmenities isKindOfClass:[NSArray class]]) {
      self.propertyAmenities = [[NSMutableArray alloc] initWithCapacity:[propertyAmenities count]];
      for (NSDictionary *amenity in propertyAmenities) {
        [self.propertyAmenities addObject:[[Amenity alloc] initWithDictionary:amenity]];
      }
    }
    else if ([propertyAmenities isKindOfClass:[NSDictionary class]]) {
      self.propertyAmenities = [[NSMutableArray alloc] initWithObjects:propertyAmenities, nil];
    }
    
    
    
    NSArray *hotelImages = [[dictionary objectForKey:@"HotelImages"] objectForKey:@"HotelImage"];
    if ([hotelImages isKindOfClass:[NSArray class]]) {
      self.hotelImages = [[NSMutableArray alloc] initWithCapacity:hotelImages.count];
      for (NSDictionary *hotelImage in hotelImages) {
        [self.hotelImages addObject:[[HotelImage alloc] initWithDictionary:hotelImage]];
      }
    }
    else if ([hotelImages isKindOfClass:[NSDictionary class]]) {
       self.hotelImages = [[NSMutableArray alloc] initWithObjects:hotelImages, nil];
    }
    
    
    //Room Types
    NSArray *roomTypes = [[dictionary objectForKey:@"RoomTypes"] objectForKey:@"RoomType"];
    if ([roomTypes isKindOfClass:[NSArray class]]) {
      self.roomTypes = [[NSMutableArray alloc] initWithCapacity:roomTypes.count];
      for (NSDictionary *roomType in roomTypes) {
        [self.roomTypes addObject:[[RoomType alloc] initWithDictionary:roomType]];
      }
    }
    else if ([roomTypes isKindOfClass:[NSDictionary class]]) {
      self.roomTypes = [[NSMutableArray alloc] initWithObjects:roomTypes, nil];
    }
    
    
    //Hotel Details
    self.hotelDetails = [[HotelDetail alloc] initWithDictionary:[dictionary objectForKey:@"HotelDetails"]];
    
    
    //Suppliers
    NSArray *suppliers = [[dictionary objectForKey:@"Suppliers"] objectForKey:@"Supplier"];
    if ([suppliers isKindOfClass:[NSArray class]]) {
      self.suppliers = [[NSMutableArray alloc] initWithCapacity:suppliers.count];
      for (NSDictionary *supplier in suppliers) {
        [self.suppliers addObject:[[Suppliers alloc] initWithDictionary:supplier]];
      }
    }
    else if ([suppliers isKindOfClass:[NSDictionary class]]) {
      self.suppliers = [[NSMutableArray alloc] initWithObjects:suppliers, nil];
    }


    
  }
  return self;
}
@end
