//
//  JKLyricFinderController.m
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKLyricFinderController.h"


@implementation JKLyricFinderController

static NSString *baseURL = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
static NSString *xMashapeKey = @"229497ddc9msh1274a5e55aaf19bp1d89a8jsn08a5dcd5d514";

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
     
    }
    return self;
}

- (void)fetchSongInfoByArtist:(NSString *)artist andWithTitle:(NSString *)title withBlock:(JKSongCompletionBlock)block {
    
    
    
}

@end
