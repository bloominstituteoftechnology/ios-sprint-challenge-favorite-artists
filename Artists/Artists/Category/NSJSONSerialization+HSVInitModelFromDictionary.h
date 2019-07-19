//
//  NSJSONSerialization+HSVInitModelFromDictionary.h
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (HSVInitModelFromDictionary)

- (void)initWithDictionary:(NSDictionary *)otherDictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
