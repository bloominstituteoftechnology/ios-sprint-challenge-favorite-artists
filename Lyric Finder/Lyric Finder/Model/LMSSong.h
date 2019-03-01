//
//  LMSSong.h
//  Lyric Finder
//
//  Created by Lisa Sampson on 3/1/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMSSong : NSObject

@property NSString *artist;
@property NSString *trackName;
@property NSString *lyrics;
@property NSInteger rating;

- (instancetype)initWithArtist: (NSString *)artist andTrackName: (NSString *)trackName andLyrics: (NSString *)lyrics andRating: (NSInteger)rating;

@end

NS_ASSUME_NONNULL_END
