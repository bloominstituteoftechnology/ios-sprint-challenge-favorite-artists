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
@property (nonatomic, readonly, copy) NSString *artistBio;
@property (nonatomic, readonly) int formedYear;

- (instancetype)initWithArtistName:(NSString *)aName
                         artistBio:(NSString *)aBio
                        formedYear:(int)aYear

NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
