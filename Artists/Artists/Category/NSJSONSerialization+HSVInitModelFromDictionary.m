//
//  NSJSONSerialization+HSVInitModelFromDictionary.m
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import "NSJSONSerialization+HSVInitModelFromDictionary.h"

@implementation NSJSONSerialization (HSVInitModelFromDictionary)


- (void)initWithDictionary:(NSDictionary *)otherDictionary {
	
}

- (NSDictionary *)toDictionary {
	return @{@"strArtist": @"",
			@"intFormedYear": @"",
			 @"strBiographyEN": @""};
}

@end
