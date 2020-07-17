//
//  HMRArtist.h
//  FavoriteArtist
//
//  Created by Harmony Radley on 7/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMRArtist : NSObject

@property (nonatomic) NSString *artist;
@property (nonatomic) int yearFormed;
@property (nonatomic) NSString *biography;

-(instancetype)initWithArtist:(NSString *)artist
                   yearFormed:(int)yearFormed
                    biography:(NSString *)biography;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
