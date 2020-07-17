//
//  EJSFavoriteArtist.h
//  FavoriteArtist
//
//  Created by Enzo Jimenez-Soto on 7/17/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EJSFavoriteArtist : NSObject

@property (nonatomic, readonly, copy) NSString *artist; // "Coldplay"
@property (nonatomic, readonly) int yearFormed; // "1996"
@property (nonatomic, readonly, copy) NSString *biography; // "Cold play are a ..."

- (instancetype)initWithartist:(NSString *)artist
                    yearFormed:(int)yearFormed
                   biography:(NSString *)biography;

@end

NS_ASSUME_NONNULL_END
