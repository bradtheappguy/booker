//
//  LocalDataModel.h
//  Booker
//
//  Created by JinNan on 5/28/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalDataModel : NSObject

@property (strong, nonatomic) NSMutableArray *reservationArray;

+ (id) sharedLocalData ;

- (void) addElementWithDictionary :(NSDictionary *) dic ;
- (void) removeElementWithIndex :(int) index ;
@end
