//
//  MSKArtistController.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/16/20.
//  Copyright © 2020 Lambda. All rights reserved.
//
#import <Foundation/Foundation.h>
@class MSKArtist;
NS_ASSUME_NONNULL_BEGIN
@interface MSKArtistController : NSObject
@property (nonatomic) NSMutableArray<MSKArtist *> *artists;
- (void)fetchArtistWithName:(NSString *)artistName completionBlock:(void (^)(MSKArtist * _Nullable artist, NSError * _Nullable error))completionBlock;
- (void)parseJSONData:(NSData *)data
      completionBlock:(void (^)(MSKArtist * _Nullable artist,
                                NSError * _Nullable error))completionBlock;
- (void)loadArtistsFromPersistence:(void (^)(NSError * _Nullable error))completionBlock;
- (void) saveArtistToPersistence:(MSKArtist *)artist completionBlock:(void (^)(NSError * _Nullable error))completionBlock;
@end
NS_ASSUME_NONNULL_END
