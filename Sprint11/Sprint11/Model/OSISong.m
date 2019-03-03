//
//  OSISong.m
//  Sprint11
//
//  Created by Sergey Osipyan on 3/1/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSISong.h"

@implementation OSISong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSString*)rating stepperValue:(int)stepperValue {
    
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _lyrics = lyrics;
        _rating = rating;
        _stepperValue = stepperValue;
    }
    
    return self;
}

@end
