//
//  SLRArtist.h
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLRArtist : NSObject

@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *biography;
@property (nonatomic) int yearFormed;

- (instancetype)initWithArtistName: (NSString *)artistName biography:(NSString *)biography yearFormed: (int)yearFormed;

@end

NS_ASSUME_NONNULL_END




