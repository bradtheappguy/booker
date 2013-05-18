//
//  RoomGroup.h
//  Booker
//
//  Created by Brad Smith on 5/9/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"

@interface RoomGroup : NSObject

@property (nonatomic) Room *room;

-(id) initWithDictionary:(NSDictionary *)dictionary;

@end
