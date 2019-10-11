//
//  REPArtistController.h
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class REPArtist;

@interface REPArtistNetController : NSObject

typedef void (^REPArtistCompletionBlock)(REPArtist *, NSError *);


- (void)fetchArtistNamed:(NSString *)name completionBlock:(REPArtistCompletionBlock)completionBlock;

@end
