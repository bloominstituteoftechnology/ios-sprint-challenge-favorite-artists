//
//  CNSArtistController.h
//  ArtistsObjCSprint
//
//  Created by Ezra Black on 6/13/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNSArtistModel.h"

typedef void (^CNSArtistControllerCompletionBlock)(CNSArtistModel *, NSError *);
@class LSIArtist;

@interface CNSArtistController : NSObject
//fetch artist from API
-(void)fetchArtistWithName:(NSString *)artistName completionBlock:(CNSArtistControllerCompletionBlock)completionBlock;
//artists array
@property NSMutableArray *artists;
//object at index
-(LSIArtist *)objectInArtistAtIndex:(NSUInteger)index;
//create
-(void)addArtistWithName:(NSString *)name
              artistBio:(NSString *)bio
              formedYear:(int)year;

//update
-(void)update:(LSIArtist *)artist
withArtistName:(NSString *)name
biography:(NSString *)bio
   formedYear:(int)year;

- (NSMutableArray *)artistArray;
@end
