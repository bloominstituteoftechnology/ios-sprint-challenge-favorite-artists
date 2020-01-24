//
//  JBArtist+NSJSONSerialization.h
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import "JBArtist.h"


@interface JBArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

