//
//  NNEArtist.h
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNEArtist : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, readonly, copy) NSString *artistBio;
@property (nonatomic, readonly) int yearFormed;

- (instancetype)initWithName:(NSString *)name
                         bio:(NSString *)artistBio
                  yearFormed:(int)yearFormed;
@end

NS_ASSUME_NONNULL_END
