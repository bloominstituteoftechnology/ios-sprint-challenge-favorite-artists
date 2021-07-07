//
//  ALWSong.h
//  

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALWSong : NSObject
    
@property NSString *songTitle;
@property NSString *songArtist;
@property NSString *songLyrics;
@property NSInteger *songRating;
    
- (instancetype)initWithSongTitle:(NSString *)songTitle andArtist:(NSString *)songArtist;
    
- (instancetype)initWithSongLyrics:(NSString *)songLyrics;
    
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
