//
//  MBArtistController.h
//  Artists
//
//  Created by Mitchell Budge on 7/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBArtist.h"
#import "MBArtist+MBNSJSONSerialization.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^MBCompletionBlock)(MBArtist *, NSError *);

@interface MBArtistController : NSObject

@property NSMutableArray *artists;
@property NSMutableArray *fetchedArtists;

- (void)createArtist:(MBArtist *)artist;

- (void)getArtist:(NSString *)name
  completionBlock:(MBCompletionBlock)completionBlock;

- (MBArtist *)fetchSavedArtist:(MBArtist *)artist;

- (void)deleteArtist:(MBArtist *)artist;

@end

NS_ASSUME_NONNULL_END
