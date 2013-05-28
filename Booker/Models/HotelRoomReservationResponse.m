//
//  HotelRoomReservationResponse.m
//  Booker
//
//  Created by Brad Smith on 5/8/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "HotelRoomReservationResponse.h"
#import "LocalDataModel.h"

@implementation HotelRoomReservationResponse
-(id) initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.eanWsError = [[EanWsError alloc] initWithDictionery:[dictionary objectForKey:@"EanWsError"]];
    self.customerSessionId = [dictionary objectForKey:@"customerSessionId"];
    
    self.itineraryId = [dictionary objectForKey:@"itineraryId"];
    
    self.processedWithConfirmation = [dictionary objectForKey:@"processedWithConfirmation"];
    self.errorText = [dictionary objectForKey:@"errorText"];
    self.hotelReplyText = [dictionary objectForKey:@"hotelReplyText"];
    self.supplierType = [dictionary objectForKey:@"supplierType"];
    self.reservationStatusCode = [dictionary objectForKey:@"reservationStatusCode"];
    self.existingItinerary = [dictionary objectForKey:@"existingItinerary"];
    self.numberOfRoomsBooked = [dictionary objectForKey:@"numberOfRoomsBooked"];
    self.drivingDirections = [dictionary objectForKey:@"drivingDirections"];
    self.checkInInstructions = [dictionary objectForKey:@"checkInInstructions"];
    self.arrivalDate = [dictionary objectForKey:@"arrivalDate"];
    self.departureDate = [dictionary objectForKey:@"departureDate"];
    self.hotelName = [dictionary objectForKey:@"hotelName"];
    self.hotelAddress = [dictionary objectForKey:@"hotelAddress"];
    self.hotelCity = [dictionary objectForKey:@"hotelCity"];
    self.hotelStateProvinceCode = [dictionary objectForKey:@"hotelStateProvinceCode"];
    self.hotelCountryCode = [dictionary objectForKey:@"hotelCountryCode"];
    self.hotelPostalCode = [dictionary objectForKey:@"hotelPostalCode"];
    self.roomDescription = [dictionary objectForKey:@"roomDescription"];
    self.rateOccupancyPerRoom = [dictionary objectForKey:@"rateOccupancyPerRoom"];
 
    self.roomGroup = [[RoomGroup alloc] initWithDictionary:[dictionary objectForKey:@"RoomGroup"]];
    
    self.rateInfo = [[RateInfo alloc] initWithDictionary:[dictionary objectForKey:@"RateInfo"]];
    
    self.confirmationNumbers = [dictionary objectForKey:@"confirmationNumbers"];
      
      [[LocalDataModel sharedLocalData] addElementWithDictionary:dictionary];

  }
  return self;
}
@end
