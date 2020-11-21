//
//  Artist.h
//  ios-FavoriteArtists-ObjectiveC-SprintChallenge
//
//  Created by BrysonSaclausa on 11/21/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly, copy) NSString *artistBio;
@property (nonatomic, readonly) int yearFormed;

- (instancetype)initWithArtistName:(NSString *)aName
                         artistBio:(NSString *)aBio
                        yearFormed:(int)aYear
NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
