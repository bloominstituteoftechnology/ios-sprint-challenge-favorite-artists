//
//  CAMArtist.h
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAMArtist : NSObject

@property NSString *name;
@property NSString *bio;
@property int founded;

- (instancetype)initWithName:(NSString *)name
                         bio:(NSString *)bio
                     founded:(int)founded;

@end

NS_ASSUME_NONNULL_END

/*
 let name: String
 let bio: String
 let founded: Int
 
 init(name: String, bio: String, founded: Int) {}
 */
