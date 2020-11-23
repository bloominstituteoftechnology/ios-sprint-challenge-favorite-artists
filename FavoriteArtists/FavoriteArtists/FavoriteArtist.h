//
//  FavoriteArtist.h
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteArtist : NSObject

- (instancetype)initWithArtist:(NSString *)anArtist
                     biography:(NSString *)aBiography
                          year:(int)aYear;

- (nullable instancetype)initWithDictionary:(NSDictionary *)aDictionary;

@property (nonatomic, readonly, copy) NSString *artist;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) int year;

@property (nonatomic, readonly, copy) NSDictionary *dictionaryValue;


@end

NS_ASSUME_NONNULL_END
