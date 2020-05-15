//
//  LYDArtistController.h
//  LYDFavoriateArtist
//
//  Created by Lydia Zhang on 5/15/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class LYDArtist;
@interface LYDArtistController : NSObject

@property (nonatomic, readonly) NSArray *artists;


- (void)loadArtistFromStore;
- (void)saveArtist:(LYDArtist *)artist;
- (void)deleteArtist:(LYDArtist *)artist;
- (void)findArtistWithName:(NSString *)name completion:(void (^)(LYDArtist * artist, NSError * error))completion;
- (void)saveArtistToStore;

@end

NS_ASSUME_NONNULL_END
