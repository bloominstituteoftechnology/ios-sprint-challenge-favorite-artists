//
//  LSIArtist.h
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist : NSObject <NSCoding>

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *bio;
@property (nonatomic) int *formed;

@end

NS_ASSUME_NONNULL_END
