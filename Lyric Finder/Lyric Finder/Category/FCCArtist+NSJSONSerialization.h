//
//  FCCArtist+NSJSONSerialization.h
//  Lyric Finder
//
//  Created by Lambda_School_Loaner_34 on 4/5/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCCArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface FCCArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryFromObject;

@end

NS_ASSUME_NONNULL_END
