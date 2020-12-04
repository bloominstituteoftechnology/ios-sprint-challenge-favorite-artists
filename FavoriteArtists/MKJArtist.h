//
//  MKJArtist.h
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MKJArtist : NSObject

- (instancetype)initWithArtist:(NSString *)anArtist
                          year:(int)aYear
                     biography:(NSString *)aBiography;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@property (nonatomic, readonly, copy) NSString *artist;
@property (nonatomic, readonly) int year;
@property (nonatomic, readonly, copy) NSString *biography;

@property (nonatomic, readonly, copy) NSDictionary *dictionaryValue;

@end

NS_ASSUME_NONNULL_END
