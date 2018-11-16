//
//  IIISongController.m
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIISongController.h"
#import "IIISong.h"

@interface IIISongController()

@property (nonatomic) NSMutableArray *internalSongs;

@end

@implementation IIISongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createSongWithTitle:(NSString *)title
                     artist:(NSString *)artist
                     lyrics:(NSString *)lyrics
                     rating:(NSInteger)rating
{
    IIISong *song = [[IIISong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [self.internalSongs addObject:song];
}



#pragma mark Getter

// This method gets called everytime app reads value of songs.
- (NSArray *)songs
{
    return self.internalSongs;
}

@end
