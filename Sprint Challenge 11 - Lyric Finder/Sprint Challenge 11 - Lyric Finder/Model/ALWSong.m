//
//  ALWSong.m
//  

#import "ALWSong.h"

@implementation ALWSong

- (instancetype)initWithSongTitle:(NSString *)songTitle andArtist:(NSString *)songArtist {
    self = [super init];
    if (self != nil) {
        _songTitle = [songTitle copy];
        _songArtist = [songArtist copy];
    }
    return self;
}
    
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    // Pull values out of the dicionary
    NSString *songLyrics = dictionary[@"lyrics_body"];
    
    return [self initWithSongLyrics:songLyrics];
}
    
    
@end
