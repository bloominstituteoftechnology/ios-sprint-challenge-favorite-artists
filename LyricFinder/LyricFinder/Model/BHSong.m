//
//  BHSong.m
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHSong.h"

@implementation BHSong

- (instancetype)init{
    self = [super init];
    if (self) {
        _UUID = [[NSUUID UUID] UUIDString];
        _title = @"";
        _artist = @"";
        _lyrics = @"";
        _rating = 0;
    }
    return self;
}

@synthesize rating = _rating;

////Setter method
//- (void) setRating:(int)rating {
//    
//    _rating = [_bodyText wordCount];
//}
//
////Getter method
//- (int) rating {
//    return _wordCount;
//}


@end
