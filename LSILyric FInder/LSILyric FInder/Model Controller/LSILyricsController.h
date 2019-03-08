//
//  LSILyricsController.h
//  LSILyric FInder
//
//  Created by Iyin Raphael on 3/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ ControllerCompletionBlock)(NSString *, NSError *);

@interface LSILyricsController : NSObject

-(void) fetchLyricswithArtistName: (NSString *)artisName title: (NSString *)title completionBlock: (ControllerCompletionBlock)completionBlock;

-(void) createLyrics: (NSString *)artistName title: (NSString *)title lyrics: (NSString *)lytrics rating: (NSInteger)rating;

@property NSArray *lyricsArray;

@end

NS_ASSUME_NONNULL_END
