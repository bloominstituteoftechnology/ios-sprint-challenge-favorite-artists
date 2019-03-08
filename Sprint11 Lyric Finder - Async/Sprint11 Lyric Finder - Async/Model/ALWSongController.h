//
//  ALWSongController.h
//  

#import <Foundation/Foundation.h>
#import "ALWSong.h"

NS_ASSUME_NONNULL_BEGIN

// Completion block that returns a song and an error
typedef void(^CompletionBlock)(ALWSong *song, NSError *error);

@interface ALWSongController : NSObject

@property NSArray *savedSongs;

- (void)searchForLyricsWithArtist:(NSString *)artist title:(NSString *)title withCompletionBlock:(CompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
