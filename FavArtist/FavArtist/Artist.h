//
//  Artist.h
//  FavArtist
//
//  Created by Norlan Tibanear on 11/30/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) int formedYear;

- (instancetype)initWithArtistName:(NSString *)aName
                        formedYear:(int)aYear
                         biography:(NSString *)aBiography;


@end

NS_ASSUME_NONNULL_END
