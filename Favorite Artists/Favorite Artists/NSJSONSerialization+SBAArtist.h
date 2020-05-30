//
//  NSJSONSerialization+SBAArtist.h
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (SBAArtist)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

//TODO Add persistence
- (BOOL)saveToPersistence;

@end

NS_ASSUME_NONNULL_END
