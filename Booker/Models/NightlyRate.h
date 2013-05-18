//
//  NightlyRate.h
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NightlyRate : NSObject

@property (nonatomic) NSNumber *isPromo;
@property (nonatomic) NSString *rate;
@property (nonatomic) NSString *baseRate;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
