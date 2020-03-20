//
//  JLAFavoriteArtist.h
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLAFavoriteArtist : NSObject

@property (nonatomic, readonly, copy) NSString *strArtist; // "Coldplay"
@property (nonatomic, readonly) int intFormedYear; // "1996"
@property (nonatomic, readonly, copy) NSString *strBiographyEN; // "Cold play are a ..."

- (instancetype)initWithStrArtist:(NSString *)strArtist
                    intFormedYear:(int)intFormedYear
                   strBiographyEN:(NSString *)strBiographyEN;

@end

NS_ASSUME_NONNULL_END
