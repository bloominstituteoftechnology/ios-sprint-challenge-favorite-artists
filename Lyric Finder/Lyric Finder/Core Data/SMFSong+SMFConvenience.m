//
//  SMFSong+SMFConvenience.m
//  Lyric Finder
//
//  Created by Samantha Gatt on 10/5/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFSong+SMFConvenience.h"

@implementation SMFSong (SMFConvenience)

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating context:(NSManagedObjectContext *)context {
    self = [self initWithContext:context];
    if (self) {
        self.title = title;
        self.artist = artist;
        self.lyrics = lyrics;
        self.rating = rating;
        
    }
    return self;
}

@end
