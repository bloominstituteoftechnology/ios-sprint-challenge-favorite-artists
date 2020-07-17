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

@property (nonatomic, readonly) NSString *artistName;
@property (nonatomic, readonly) NSString *biography;
@property (nonatomic, readonly) int yearFormed;

- (instancetype)initWithArtistName:(NSString *)artistName
                         biography:(NSString *)biography
                        yearFormed:(int)yearFormed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
