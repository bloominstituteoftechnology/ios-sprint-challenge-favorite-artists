//
//  LSIArtistController.h
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIArtist.h"

typedef void (^LSIArtistControllerCompletionBlock)(LSIArtist *, NSError *);
@class LSIArtist;

@interface LSIArtistController : NSObject
//fetch artist from API
-(void)fetchArtistWithName:(NSString *)artistName completionBlock:(LSIArtistControllerCompletionBlock)completionBlock;
//artists array
@property NSMutableArray *artists;
//object at index
-(LSIArtist *)objectInArtistAtIndex:(NSUInteger)index;
//create
-(void)addArtistWithName:(NSString *)name
              artistBio:(NSString *)bio
              formedYear:(int)year;


@end

