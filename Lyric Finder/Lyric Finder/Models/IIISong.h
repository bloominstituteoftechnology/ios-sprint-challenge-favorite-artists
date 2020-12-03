//
//  IIISong.h
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIISong : NSObject <NSCoding>

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *artist;
@property (nonatomic) NSString *lyrics;
@property (nonatomic) int rating;

- (instancetype)initWithTitle: (NSString *)title
                       artist: (NSString *)artist
                       lyrics: (NSString *)lyrics
                       rating: (int)rating;

@end

NS_ASSUME_NONNULL_END
