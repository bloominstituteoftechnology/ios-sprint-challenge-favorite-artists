//
//  MJRArtistController.h
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MJRArtist;

@interface MJRArtistController : NSObject

- (void)searchArtistWithName:(NSString *)artistName completion:(void (^)(MJRArtist *artist, NSError *error))completion;

@end
