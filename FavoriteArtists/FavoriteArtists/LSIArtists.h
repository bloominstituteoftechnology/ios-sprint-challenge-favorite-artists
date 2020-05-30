//
//  LSIArtists.h
//  FavoriteArtists
//
//  Created by Alex Thompson on 5/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface LSIArtists : NSObject

@property (nonatomic, readonly, copy) NSString *artist;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) int yearFormed;

- (instancetype)initWithArtist:(NSString *)strArtist
                     biography:(NSString *)biography
                     yearFormed:(int)yearFormed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
