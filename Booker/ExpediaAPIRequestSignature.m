//
//  ExpediaAPIRequestSignature.m
//  Booker
//
//  Created by Brad Smith on 3/28/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "ExpediaAPIRequestSignature.h"

@implementation ExpediaAPIRequestSignature

+(ExpediaAPIRequestSignature *)signatureWithAPIKey:(NSString *)apiKey secret:(NSString *)apiSecret {
  if (apiKey == nil || apiSecret == nil) {
    [[NSException exceptionWithName:@"Expedia API Exception" reason:@"apiKey and apiSecret must be set" userInfo:nil] raise];
  }
  NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
  return  [ExpediaAPIRequestSignature stringWithFormat:@"%@%@%f",apiKey,apiSecret,timestamp];
}

@end
