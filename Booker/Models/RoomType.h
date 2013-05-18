//
//  RoomType.h
//  Booker
//
//  Created by Brad Smith on 4/7/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoomType : NSObject

@property (nonatomic) NSString *roomCode;
@property (nonatomic) NSString *roomTypeId;
@property (nonatomic) NSString *description;
@property (nonatomic) NSString *descriptionLong;
@property (nonatomic) NSMutableArray *roomAmenities;

-(id) initWithDictionary:(NSDictionary *)dictionary;

@end
