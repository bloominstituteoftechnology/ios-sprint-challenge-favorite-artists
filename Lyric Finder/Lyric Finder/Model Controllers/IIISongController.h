//
//  IIISongController.h
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIISongController : NSObject //NSCoding

@property (nonatomic) NSArray *songs;

- (void)createSongWithTitle:(NSString *)title
                     artist:(NSString *)artist
                     lyrics:(NSString *)lyrics
                     rating:(int)rating;

- (void)searchLyricsWithArtist:(NSString *)artist
                       title:(NSString *)title
                   completion:(void (^)(NSString *lyrics, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
