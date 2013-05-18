//
//  EanWsError.m
//  Booker
//
//  Created by Brad Smith on 3/29/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "EanWsError.h"

@implementation EanWsError

-(id) initWithDictionery:(NSDictionary *)dictionary {
  if (!dictionary) {
    return nil;
  }
  if (self = [super init]) {
    self.itineraryId = [dictionary objectForKey:@"itineraryId"];
    self.handling = [dictionary objectForKey:@"handling"];
    self.category = [dictionary objectForKey:@"category"];
    self.exceptionalConditionID = [dictionary objectForKey:@"exceptionalConditionId"];
    self.presentationMessage = [dictionary objectForKey:@"presentationMessage"];
    self.verboseMessage = [dictionary objectForKey:@"verboseMessage"];
  }
  return self;
}

@end



