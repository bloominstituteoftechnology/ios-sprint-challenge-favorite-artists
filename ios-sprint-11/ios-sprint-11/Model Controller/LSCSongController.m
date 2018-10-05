//
//  LSCSongController.m
//  ios-sprint-11
//
//  Created by David Doswell on 10/5/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

#import "LSCSongController.h"
#import "LSCSong.h"

@implementation LSCSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _songs = [[NSArray alloc ] initWithObjects:
                  [[LSCSong alloc] initWithSongTitle:@"Get Back" artistName:@"The Beatles" songLyrics:@"Get back! Get back! Get back to where you belong." songRating:4],
                  nil];
    }
    return self;
}

@end
