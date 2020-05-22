//
//  MSKArtistController.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/16/20.
//  Copyright © 2020 Lambda. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MSKArtist.h"
NS_ASSUME_NONNULL_BEGIN

@interface MSKArtistController : NSObject
@property (readwrite, nonatomic) NSMutableArray *artists;
@property (readwrite, nonatomic) MSKArtist *artist;
- (void)fetchArtistWithName:(NSString *)artistName completionBlock:(void (^)(MSKArtist * _Nullable artist, NSError * _Nullable error))completionBlock;
-(void)removeArtistFromAppAtIndex:(NSUInteger *)index;
-(void)loadArtistsFromPersistence:(void (^)(NSError * _Nullable error))completionBlock;
- (void) saveArtistToPersistence:(MSKArtist *)artist completionBlock:(void(^)(NSString *_Nullable alreadyInString, NSError *_Nullable error))completionBlock;
@end
NS_ASSUME_NONNULL_END
