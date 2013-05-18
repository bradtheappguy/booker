//
//  HotelInformationResponse.h
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EanWsError.h"
#import "HotelSummarie.h"
#import "HotelDetail.h"

@interface HotelInformationResponse : NSObject
@property NSString *customerSessionId;
@property EanWsError *eanWsError;

@property (nonatomic) NSMutableArray *propertyAmenities; //Strings
@property (nonatomic) NSMutableArray *hotelImages; //Strings
@property (nonatomic) NSMutableArray *roomTypes; // RoomType
@property (nonatomic) HotelSummarie *hotelSummary; // RoomType
@property (nonatomic) HotelDetail *hotelDetails;
@property (nonatomic) NSMutableArray *suppliers;
@property (nonatomic) NSString *hotelId;

-(id) initWithDictionary:(NSDictionary *)dictionary;

@end
