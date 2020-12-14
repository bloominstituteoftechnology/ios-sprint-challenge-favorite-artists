//
//  FavoriteArtist.h
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteArtist : NSObject

@property (nonatomic, readonly, copy) NSString *artist;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) int year;

- (instancetype) initWithArtist:(NSString *)artist
                     biography:(NSString *)biography
                          year:(int)year;


@end

NS_ASSUME_NONNULL_END
