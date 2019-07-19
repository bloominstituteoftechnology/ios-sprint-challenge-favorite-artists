//
//  NSJSONSerialization+KRCArtistCreation.h
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class KRCArtist;

@interface NSJSONSerialization (KRCArtistCreation)

+ (KRCArtist *)ArtistFromJson:(NSDictionary *)jsonictionary;

+ (NSDictionary *)JsonFromArtists:(NSArray *)artists;

@end

NS_ASSUME_NONNULL_END
