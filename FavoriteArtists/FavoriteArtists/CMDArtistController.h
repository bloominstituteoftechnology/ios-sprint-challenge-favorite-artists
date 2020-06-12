//
//  CMDArtistController.h
//  FavoriteArtists
//
//  Created by Chris Dobek on 6/12/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CMDArtist;
@interface CMDArtistController : NSObject

@property (nonatomic, readonly) NSArray *artists;


- (void)loadArtistFromStore;
- (void)saveArtist:(CMDArtist *)artist;
- (void)deleteArtist:(CMDArtist *)artist;
- (void)findArtistWithName:(NSString *)name completion:(void (^)(CMDArtist * artist, NSError * error))completion;
- (void)saveArtistToStore;

@end

NS_ASSUME_NONNULL_END
