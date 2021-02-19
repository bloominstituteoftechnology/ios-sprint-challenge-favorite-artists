//
//  Artist.h
//  FavoriteArtists
//
//  Created by John McCants on 2/18/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly, copy) NSString *bioText;
@property (nonatomic, readonly) int yearFormed;

-(instancetype)initWithArtistName:(NSString *)aName
                yearFormed:(int)aYear
                          bioText:(NSString *)aBioText;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
