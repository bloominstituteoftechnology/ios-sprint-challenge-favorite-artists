//
//  DLJArtistController.h
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLJArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^DLJCompletionBlock)(DLJArtist *, NSError *);



@interface DLJArtistController : NSObject

- (void)fetchArtistsWithName:(NSString *)name completion:(DLJCompletionBlock)completion;

-(void)saveArtist:(DLJArtist *)artist;



- (NSMutableArray *)artistArray;

-(DLJArtist *)getSavedArtist:(DLJArtist *)artist;

@end

NS_ASSUME_NONNULL_END
