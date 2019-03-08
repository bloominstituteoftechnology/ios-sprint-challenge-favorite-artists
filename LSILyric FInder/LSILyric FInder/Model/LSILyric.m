//
//  LSILyric.m
//  LSILyric FInder
//
//  Created by Iyin Raphael on 3/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSILyric.h"

@implementation LSILyric

- (instancetype)initWithTitle:(NSString *)title arstistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    self = [super self];
    if (self) {
        self.title = title;
        self.artistName = artistName;
        self.lyrics = lyrics;
        self.rating = rating;
    }
    
    return self;
}

@end
