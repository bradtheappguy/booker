//
//  Room.h
//  Booker
//
//  Created by Brad Smith on 5/9/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Room : NSObject

@property (nonatomic) NSNumber *bedTypeId;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSNumber *numberOfAdults;
@property (nonatomic) NSNumber *numberOfChildren;
@property (nonatomic) NSString *smokingPreference;

-(id) initWithDictionary:(NSDictionary *)dictionary;
@end
