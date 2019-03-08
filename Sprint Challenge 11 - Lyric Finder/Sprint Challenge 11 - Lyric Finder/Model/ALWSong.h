//
//  ALWSong.h
//  

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ALWSong : NSObject
    
@property (nonatomic, copy) NSString *songTitle;
@property (nonatomic, copy) NSString *songArtist;
@property (nonatomic, copy) NSString *songLyrics;
@property (nonatomic) NSInteger *songRating;
    
- (instancetype)initWithSongTitle:(NSString *)songTitle andArtist:(NSString *)songArtist;
    
- (instancetype)initWithSongLyrics:(NSString *)songLyrics;
    
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
