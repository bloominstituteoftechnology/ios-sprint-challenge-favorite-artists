//
//  ALWSongController.h
//  

#import <Foundation/Foundation.h>
#import "ALWSong.h"
#import "ALWLyrics.h"

NS_ASSUME_NONNULL_BEGIN

// Completion block that returns lyrics and an error
//typedef void (^CompletionBlock)(ALWSong *song, NSError *error);
typedef void(^CompletionBlock)(ALWSong * _Nullable, NSError * _Nullable);

@interface ALWSongController : NSObject
    
- (void)searchLyricsWithArtist:(NSString *)songArtist andTitle:(NSString *)songTitle withCompletionBlock:(CompletionBlock)completionBlock;

- (void)saveSong:(ALWSong *)song;

@property (nonatomic, readonly) NSArray *savedSongs;

    

@end

NS_ASSUME_NONNULL_END
