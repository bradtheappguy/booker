//
//  ExpediaAPIClient.h
//  Booker
//
//  Created by Brad Smith on 3/28/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "AFHTTPClient.h"
#import <RestKit/RestKit.h>
#import "PingResponse.h"
#import "HotelListResponse.h"
#import "HotelInformationResponse.h"
#import "HotelRoomAvailabilityResponse.h"
#import "HotelRoomCancellationResponse.h"

@interface ExpediaAPIClient : AFHTTPClient {
  RKObjectManager *objectManager;
}

+ (id)sharedClient;

- (void)performGeoSearchWithParamaters:(NSDictionary *)params
                               success:(void (^)(NSArray  *locationInfos))success
                               failure:(void (^)(NSError *error))failure;

- (void)performPingWithParamaters:(NSDictionary *)params
                          success:(void (^)(PingResponse  *pingResponse))success
                          failure:(void (^)(NSError *error))failure;

- (void)performHotelListWithParamaters:(NSDictionary *)params
                               success:(void (^)(HotelListResponse *pingResponse))success
                               failure:(void (^)(NSError *error))failure;

- (void)performHotelInfoWithParamaters:(NSDictionary *)params
                               success:(void (^)(HotelInformationResponse *hotelListResponse))success
                               failure:(void (^)(NSError *error))failure;

- (void)performRoomAvailabilityWithParamaters:(NSDictionary *)params
                                      success:(void (^)(HotelRoomAvailabilityResponse *hotelListResponse))success
                                      failure:(void (^)(NSError *error))failure;

- (void)performCancelReservationWithParamaters:(NSDictionary *)params
                                      success:(void (^)(HotelRoomCancellationResponse *hotelCancelResponse))success
                                      failure:(void (^)(NSError *error))failure;

@property (nonatomic) NSString *apiKey;
@property (nonatomic) NSString *apiSecret;

@end
