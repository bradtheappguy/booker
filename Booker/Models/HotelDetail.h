//
//  HotelDetail.h
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelDetail : NSObject

@property (nonatomic) NSString *areaInformation;
@property (nonatomic) NSString *checkInTime;
@property (nonatomic) NSString *drivingDirections;
@property (nonatomic) NSString *hotelPolicy;
@property (nonatomic) NSNumber *numberOfFloors;
@property (nonatomic) NSNumber *numberOfRooms;
@property (nonatomic) NSString *propertyDescription;
@property (nonatomic) NSString *propertyInformation;
@property (nonatomic) NSString *roomInformation;
@property (nonatomic) NSString *checkInInstructions;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
