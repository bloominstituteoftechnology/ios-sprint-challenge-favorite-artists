//
//  MBArtist+MBNSJSONSerialization.h
//  Artists
//
//  Created by Mitchell Budge on 7/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBArtist (MBNSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)artistDictionary;

@end

NS_ASSUME_NONNULL_END
