//
//  JLRArtist.h
//  FavoriteArtists
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLRArtist : NSObject

@property (nonatomic, copy, readonly) NSString *artistName;
@property (nonatomic, copy, readonly) NSString *artistBio;
@property (nonatomic, readonly) int yearFormed;

@end

NS_ASSUME_NONNULL_END
