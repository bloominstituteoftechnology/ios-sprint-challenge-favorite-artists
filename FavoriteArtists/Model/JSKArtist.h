//
//  JSKArtist.h
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSKArtist : NSObject

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly, copy) NSString *artistBio;
@property (nonatomic, readonly, copy) NSNumber *yearFormed;

- (instancetype)initWithArtistName:(NSString *)aArtistName
                        artistBio:(NSString *)aArtistBio
                       yearFormed:(int)aYearFormed;

@end

NS_ASSUME_NONNULL_END
