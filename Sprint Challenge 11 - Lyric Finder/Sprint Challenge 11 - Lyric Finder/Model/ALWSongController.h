//
//  ALWSongController.h
//  

#import <Foundation/Foundation.h>
#import "ALWSong.h"
#import "ALWLyrics.h"

NS_ASSUME_NONNULL_BEGIN

// Completion block that returns lyrics and an error
typedef void (^CompletionBlock)(ALWSong *song, NSError *error);

@interface ALWSongController : NSObject
    
- (void)searchLyricsWithArtist:(NSString *)songArtist andTitle:(NSString *)songTitle withCompletionBlock:(CompletionBlock)completionBlock;

    

@end

NS_ASSUME_NONNULL_END
