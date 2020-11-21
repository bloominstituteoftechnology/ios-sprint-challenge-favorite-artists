//
//  Artists.h
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface Artists : NSObject

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;
@property (nonatomic, readonly, copy) NSDictionary *dictionaryValue;

- (instancetype)initWithArtists:(NSArray<Artist *> *)someArtists;

- (nullable instancetype)initWithDictionary:(NSDictionary *)aDictionary;

@end

NS_ASSUME_NONNULL_END
