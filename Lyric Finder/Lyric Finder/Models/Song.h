//
//  Song.h
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Song : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *artist;
@property (nonatomic) NSString *lyrics;
@property (nonatomic) NSInteger *rating;

- (instancetype)initWithTitle: (NSString *)title
                       artist: (NSString *)artist
                       lyrics: (NSString *)lyrics
                       rating: (NSInteger)rating;

@end

NS_ASSUME_NONNULL_END
