//
//  MJPArtist.h
//  Artists
//
//  Created by Mark Poggi on 6/12/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJPArtist : NSObject

@property (nonatomic) NSString *strArtist;
@property (nonatomic) int yearFormed;
@property (nonatomic) NSString *strBiographyEN;

- (instancetype)initWithStrArtist:(NSString *)strArtist yearFormed:(int)yearFormed strBiographyEN:(NSString *)strBiographyEN;

@end

NS_ASSUME_NONNULL_END
