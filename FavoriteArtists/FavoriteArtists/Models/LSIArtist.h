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

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic) int formed;

- (instancetype) initWithName:(NSString *)name formed:(int)formed bio:(NSString *)bio;

@end

NS_ASSUME_NONNULL_END
