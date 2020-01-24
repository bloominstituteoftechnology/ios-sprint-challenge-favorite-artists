//
//  CCCArtistController.h
//  ios-sprint-challenge-favorite-artists
//
//  Created by Jonalynn Masters on 1/24/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^CCCArtistSearchCompletionBlock)(CCCArtist *, NSError *);

@interface CCCArtistController : NSObject

- (void)saveArtist:(CCCArtist *)artist;

- (CCCArtist *)fetchSavedArtist:(CCCArtist *)artist;

- (NSMutableArray *)fetchAllSavedArtists;

- (void)searchForArtist:(NSString *)name
        completionBlock:(CCCArtistSearchCompletionBlock)completionBlock;



@end

NS_ASSUME_NONNULL_END
