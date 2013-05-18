//
//  HotelRoomReservationResponse.h
//  Booker
//
//  Created by Brad Smith on 5/8/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EanWsError.h"
#import "RateInfo.h"
#import "RoomGroup.h"


@interface HotelRoomReservationResponse : NSObject
@property NSString *customerSessionId;
@property EanWsError *eanWsError;

@property (nonatomic) NSNumber *itineraryId;
@property (nonatomic) NSNumber *processedWithConfirmation;
@property (nonatomic) NSString *errorText;
@property (nonatomic) NSString *hotelReplyText;
@property (nonatomic) NSString *supplierType;
@property (nonatomic) NSString *reservationStatusCode;
@property (nonatomic) NSNumber *existingItinerary;
@property (nonatomic) NSNumber *numberOfRoomsBooked;
@property (nonatomic) NSString *drivingDirections;
@property (nonatomic) NSString *checkInInstructions;
@property (nonatomic) NSString *arrivalDate;
@property (nonatomic) NSString *departureDate;
@property (nonatomic) NSString *hotelName;
@property (nonatomic) NSString *hotelAddress;
@property (nonatomic) NSString *hotelCity;
@property (nonatomic) NSString *hotelStateProvinceCode;
@property (nonatomic) NSString *hotelCountryCode;
@property (nonatomic) NSString *hotelPostalCode;
@property (nonatomic) NSString *roomDescription;
@property (nonatomic) NSNumber *rateOccupancyPerRoom;

@property (nonatomic) RoomGroup *roomGroup;


@property (nonatomic) NSNumber *confirmationNumbers;


@property (nonatomic) RateInfo *rateInfo;

-(id) initWithDictionary:(NSDictionary *)dictionary;
@end
