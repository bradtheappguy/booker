//
//  LocalDataModel.m
//  Booker
//
//  Created by JinNan on 5/28/13.
//  Copyright (c) 2013 Brad Smith. All rights reserved.
//

#import "LocalDataModel.h"

@implementation LocalDataModel

+ (id) sharedLocalData {

    static LocalDataModel *sharedLocalData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLocalData = [[self alloc] init];
    });
    return sharedLocalData;
}

- (id)init {
    if (self = [super init]) {
        
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        if (standardUserDefaults) {
            self.reservationArray = (NSMutableArray *) [standardUserDefaults objectForKey:@"reservationArray"];
        }
        if (!self.reservationArray) {
            self.reservationArray = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (void) addElementWithDictionary :(NSDictionary *) dic {
    [[[LocalDataModel sharedLocalData] reservationArray] addObject:dic];
    [[NSUserDefaults standardUserDefaults] setObject:[[LocalDataModel sharedLocalData] reservationArray] forKey:@"reservationArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) removeElementWithIndex :(int) index {
    [[[LocalDataModel sharedLocalData] reservationArray] removeObjectAtIndex:index];
    [[NSUserDefaults standardUserDefaults] setObject:[[LocalDataModel sharedLocalData] reservationArray] forKey:@"reservationArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
