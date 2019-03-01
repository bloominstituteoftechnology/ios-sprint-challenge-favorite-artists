//
//  ALWSong.m
//  

#import "ALWSong.h"

@implementation ALWSong

- (instancetype)initWithSongTitle:(NSString *)songTitle andArtist:(NSString *)songArtist andLyrics:(NSString *)songLyrics {
    self = [super init];
    if (self != nil) {
        _songTitle = [songTitle copy];
        _songArtist = [songArtist copy];
        _songLyrics = [songLyrics copy];
    }
    return self;
    
    
}
    
    
@end
