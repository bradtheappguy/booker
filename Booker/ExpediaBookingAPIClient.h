//
//  ExpediaBookingAPIClient.h
//  Booker
//
//  Created by Brad Smith on 5/8/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "ExpediaAPIClient.h"
#import "HotelRoomReservationResponse.h"

@interface ExpediaBookingAPIClient : ExpediaAPIClient
- (void)performBookReservationWithParamaters:(NSDictionary *)params
                                     success:(void (^)(HotelRoomReservationResponse *hotelListResponse))success
                                     failure:(void (^)(NSError *error))failure;
@end
