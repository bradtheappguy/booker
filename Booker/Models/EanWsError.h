//
//  EanWsError.h
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EanWsError : NSObject

@property (nonatomic) NSNumber *itineraryId;
@property (nonatomic) NSString *handling;
@property (nonatomic) NSString *category;
@property (nonatomic) NSNumber *exceptionalConditionID;
@property (nonatomic) NSString *presentationMessage;
@property (nonatomic) NSString *verboseMessage;

-(id) initWithDictionery:(NSDictionary *)dictionary;
@end
