//
//  JLCArtistController.h
//  Favorite-Artists-ST
//
//  Created by Jake Connerly on 11/8/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLCArtist.h"

@interface JLCArtistController : NSObject


@property (nonatomic, readonly) NSArray *favoriteArtist;

-(void)searchForArtistWithArtistName:(NSString *)artistName
completion:(void (^)(JLCArtist *artist, NSError *error))completion;

-(void)addFavoriteArtist:(JLCArtist *)artist;

@end

