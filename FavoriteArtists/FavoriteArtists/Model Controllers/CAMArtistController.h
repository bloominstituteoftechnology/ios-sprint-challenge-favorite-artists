//
//  CAMArtistController.h
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAMArtist.h"
#import "CAMArtist+Serialization.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^artistCompletion) (CAMArtist *, NSError *);

@interface CAMArtistController : NSObject

@property (readonly, nonatomic) NSArray *favoriteArtists;
@property (readonly, nonatomic) CAMArtist *currentArtist;

-(void)loadArtists;
-(void)saveArtist:(CAMArtist *)artist;
-(void)deleteArtist:(CAMArtist *)artist;
-(void)searchForName:(NSString *)name
          completion:(artistCompletion)completion;

@end

NS_ASSUME_NONNULL_END
