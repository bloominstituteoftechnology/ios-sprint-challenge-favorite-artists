//
//  LSIArtist.h
//  FavoriteArtists
//
//  Created by Kelson Hartle on 8/2/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist : NSObject

@property (nonatomic) NSString *artistName;
@property (nonatomic) NSNumber *yearFormed;
@property (nonatomic) NSString *biography;

- (instancetype)initWithArtistName:(NSString *)artistName                                       yearFormed:(NSNumber *)yearFormed
                         biography:(NSString *)biography;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
