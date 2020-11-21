//
//  Artist.h
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly) int formedYear;
@property (nonatomic, readonly, copy) NSString *biography;

@property (nonatomic, readonly, copy) NSDictionary *dictionaryValue;

- (instancetype)initWithArtistName:(NSString *)aName
                        formedYear:(int)aYear
                         biography:(NSString *)aBiography;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
