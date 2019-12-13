//
//  GIPArtistController.h
//  Favorite-Artists
//
//  Created by Gi Pyo Kim on 12/13/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GIPArtist;

@interface GIPArtistController : NSObject

//@property NSMutableArray *artists;

- (void)searchArtistWithName:(NSString *)name completion:(void (^)(GIPArtist *artist, NSError *error))completion;

@end

