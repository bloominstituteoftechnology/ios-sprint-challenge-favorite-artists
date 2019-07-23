//
//  LSIArtistController.h
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIArtist.h"
#import "LSINSObject+JSONSerialization.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^LSIArtistControllerCompletionBlock)(NSArray *allArtists, NSError *);

@interface LSIArtistController : NSObject

@property NSMutableArray *allArtists;

//Fetch
- (void)fetchArtist:(NSString *)name completionBlock:(LSIArtistControllerCompletionBlock)completionBlock;

//Create
//- (void)createArtist:(LSIArtist *)artist;

@end

NS_ASSUME_NONNULL_END
