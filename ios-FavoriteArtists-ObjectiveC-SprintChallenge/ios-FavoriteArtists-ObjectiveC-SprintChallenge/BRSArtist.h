//
//  Artist.h
//  ios-FavoriteArtists-ObjectiveC-SprintChallenge
//
//  Created by BrysonSaclausa on 11/21/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BRSArtist : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *bio;
@property (nonatomic, readonly)       int      yearFormed;

- (instancetype)initWithName:(NSString *)name
                         bio:(NSString *)bio
                  yearFormed:(int)yearFormed;

@end

NS_ASSUME_NONNULL_END
