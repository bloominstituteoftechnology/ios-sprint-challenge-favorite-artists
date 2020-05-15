//
//  CBDArtist.h
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBDArtist : NSObject

@property NSString *strArtist;
@property int yearFormed;
@property NSString *strBiographyEN;

- (instancetype)initWithStrArtist:(NSString *)strArtist
                  yearFormed:(int)yearFormed
                     strBiographyEN:(NSString *)strBiographyEN;

@end

NS_ASSUME_NONNULL_END
