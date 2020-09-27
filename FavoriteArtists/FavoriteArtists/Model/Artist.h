//
//  Artist.h
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

- (instancetype)initWithArtistName:(NSString *)aName
                        yearFormed:(int)aYearFormed
                         biography:(NSString *)aBiography NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) int yearFormed;
@property (nonatomic, readonly, copy, nullable) NSString *biography;

@end

NS_ASSUME_NONNULL_END
