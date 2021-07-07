//
//  NELLyric+NELNSJSONSerialization.h
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELLyric.h"

NS_ASSUME_NONNULL_BEGIN

@interface NELLyric (NELNSJSONSerialization)

- (instancetype)intiWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;



@end

NS_ASSUME_NONNULL_END
