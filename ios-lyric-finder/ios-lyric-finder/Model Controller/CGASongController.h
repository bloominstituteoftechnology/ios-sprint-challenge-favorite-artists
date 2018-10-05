//
//  CGASongController.h
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGASongController : NSObject

- (void)searchForSongWithArtist:(NSString *)artist track:(NSString *)track completion:(void (^)(NSString *, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
