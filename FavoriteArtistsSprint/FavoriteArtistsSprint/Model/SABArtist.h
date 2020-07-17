//
//  SABArtist.h
//  FavoriteArtistsSprint
//
//  Created by Stephanie Ballard on 7/17/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SABArtist : NSObject

// artist name
// biography
// year formed

@property (nonatomic, readonly) NSString *strArtist;
@property (nonatomic, readonly) NSString *strBiographyEN;
@property (nonatomic, readonly) int intFormedYear;

- (instancetype)initWithArtistName:(NSString *)strArtist
                         biography:(NSString *)strBiographyEN
                        yearFormed:(int)intFormedYear;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
