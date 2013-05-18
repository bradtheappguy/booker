//
//  ExpediaBookingAPIClient.m
//  Booker
//
//  Created by Brad Smith on 5/8/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "ExpediaBookingAPIClient.h"

@implementation ExpediaBookingAPIClient

static NSString *kBaseURL = @"https://book.api.ean.com";

+ (id)sharedClient {
  static ExpediaBookingAPIClient *sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
  });
  return sharedClient;
}

- (void)performBookReservationWithParamaters:(NSDictionary *)params
                               success:(void (^)(HotelRoomReservationResponse *hotelListResponse))success
                               failure:(void (^)(NSError *error))failure {
  NSString *path=@"ean-services/rs/hotel/v3/res";
  [self postPath:path
     parameters:params
        success:^(AFHTTPRequestOperation *operation, id JSON) {
          JSON = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:nil];
          HotelRoomReservationResponse *response = [[HotelRoomReservationResponse alloc] initWithDictionary:[JSON objectForKey:@"HotelRoomReservationResponse"]];
          if (response.eanWsError) {
            failure([NSError errorWithDomain:@"cx.bradsmith.ean" code:1 userInfo:@{NSLocalizedDescriptionKey: [response.eanWsError presentationMessage]}]);
            return;
          }
          else if (response) {
            success(response);
          }
          else {
            failure([NSError errorWithDomain:@"cx.bradsmith.ean" code:1 userInfo:@{NSLocalizedDescriptionKey: @"Expected data not returned"}]);
          }
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          failure(error);
        }];
}

@end
