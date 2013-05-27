//
//  ExpediaAPIClient.m
//  Booker
//
//  Created by Brad Smith on 3/28/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "ExpediaAPIClient.h"
#import "ExpediaAPIRequestSignature.h"
#import "LocationInfoResponse.h"

@implementation ExpediaAPIClient

static NSString *kBaseURL = @"http://api.ean.com";

+ (id)sharedClient {
  static ExpediaAPIClient *sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
  });
  return sharedClient;
}


-(NSDictionary *) standardParamaters {
  return @{@"sig": [ExpediaAPIRequestSignature signatureWithAPIKey:self.apiKey secret:self.apiSecret],
           @"apiKey": self.apiKey,
           @"cid": @"55505"
           };
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters {
  NSMutableDictionary *p = [[NSMutableDictionary alloc] initWithDictionary:parameters];
  [p addEntriesFromDictionary:[self standardParamaters]];
  return [super requestWithMethod:method path:path parameters:p];
}


- (void)performGeoSearchWithParamaters:(NSDictionary *)params
                               success:(void (^)(NSArray  *locationInfos))success
                               failure:(void (^)(NSError *error))failure {
  NSString *path=@"ean-services/rs/hotel/v3/geoSearch";
  [self getPath:path
     parameters:params
        success:^(AFHTTPRequestOperation *operation, id JSON) {
                    JSON = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:nil];
                    LocationInfoResponse *response = [[LocationInfoResponse alloc] initWithDictionary:[JSON objectForKey:@"LocationInfoResponse"]];
                    if (response.eanWsError) {
                      failure([NSError errorWithDomain:@"cx.bradsmith.ean" code:1 userInfo:@{NSLocalizedDescriptionKey: [response.eanWsError presentationMessage]}]);
                      return;
                    }
                    else if ([response.locationInfos count] > 0) {
                      success(response.locationInfos);
                    }
                    else {
                      failure([NSError errorWithDomain:@"cx.bradsmith.ean" code:1 userInfo:@{NSLocalizedDescriptionKey: @"Expected data not returned"}]);
                    }
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          failure(error);
        }];
}

- (void)performPingWithParamaters:(NSDictionary *)params
                               success:(void (^)(PingResponse *pingResponse))success
                               failure:(void (^)(NSError *error))failure {
  NSString *path=@"ean-services/rs/hotel/v3/ping";
  [self getPath:path
     parameters:params
        success:^(AFHTTPRequestOperation *operation, id JSON) {
          JSON = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:nil];
          PingResponse *response = [[PingResponse alloc] initWithDictionary:[JSON objectForKey:@"PingResponse"]];
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


- (void)performHotelListWithParamaters:(NSDictionary *)params
                          success:(void (^)(HotelListResponse *hotelListResponse))success
                          failure:(void (^)(NSError *error))failure {
  NSString *path=@"ean-services/rs/hotel/v3/list";
  [self getPath:path
     parameters:params
        success:^(AFHTTPRequestOperation *operation, id JSON) {
          JSON = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:nil];
          HotelListResponse *response = [[HotelListResponse alloc] initWithDictionary:[JSON objectForKey:@"HotelListResponse"]];
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

- (void)performHotelInfoWithParamaters:(NSDictionary *)params
                               success:(void (^)(HotelInformationResponse *hotelListResponse))success
                               failure:(void (^)(NSError *error))failure {
  NSString *path=@"ean-services/rs/hotel/v3/info";
  [self getPath:path
     parameters:params
        success:^(AFHTTPRequestOperation *operation, id JSON) {
          JSON = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:nil];
          HotelInformationResponse *response = [[HotelInformationResponse alloc] initWithDictionary:[JSON objectForKey:@"HotelInformationResponse"]];
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

- (void)performRoomAvailabilityWithParamaters:(NSDictionary *)params
                               success:(void (^)(HotelRoomAvailabilityResponse *hotelListResponse))success
                               failure:(void (^)(NSError *error))failure {
  NSString *path=@"ean-services/rs/hotel/v3/avail";
  [self getPath:path
     parameters:params
        success:^(AFHTTPRequestOperation *operation, id JSON) {
          JSON = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:nil];
          HotelRoomAvailabilityResponse *response = [[HotelRoomAvailabilityResponse alloc] initWithDictionary:[JSON objectForKey:@"HotelRoomAvailabilityResponse"]];
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

- (void)performCancelReservationWithParamaters:(NSDictionary *)params
                                success:(void (^)(HotelRoomCancellationResponse *hotelCancelResponse))success
                                failure:(void (^)(NSError *error))failure {
    NSString *path=@"ean-services/rs/hotel/v3/cancel";
    [self getPath:path
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id JSON) {
              JSON = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:nil];
              HotelRoomCancellationResponse *response = [[HotelRoomCancellationResponse alloc] initWithDictionary:[JSON objectForKey:@"HotelRoomCancellationResponse"]];
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
