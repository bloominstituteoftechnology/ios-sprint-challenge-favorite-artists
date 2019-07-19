//
//  LSIArtist.h
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist : NSObject

@property NSString *name;
@property NSString *bio;
@property NSInteger *formed;

- (instancetype) initWithName:(NSString *)name formed:(NSInteger)formed bio:(NSString *)bio;

@end

NS_ASSUME_NONNULL_END
