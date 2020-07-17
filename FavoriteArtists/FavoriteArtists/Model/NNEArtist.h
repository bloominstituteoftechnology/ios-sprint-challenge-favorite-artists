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

@property (nonatomic, readonly, copy) NSString *artist;
@property (nonatomic, readonly) int yearFormed;
@property (nonatomic, readonly, copy) NSString *biography; 

- (instancetype)initWithartist:(NSString *)artist
                    yearFormed:(int)yearFormed
                   biography:(NSString *)biography;

@end

NS_ASSUME_NONNULL_END
