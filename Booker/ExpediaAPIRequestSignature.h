//
//  ExpediaAPIRequestSignature.h
//  Booker
//
//  Created by Brad Smith on 3/28/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpediaAPIRequestSignature : NSString
+(NSString *)signatureWithAPIKey:(NSString *)apiKey secret:(NSString *)secret;
@end
