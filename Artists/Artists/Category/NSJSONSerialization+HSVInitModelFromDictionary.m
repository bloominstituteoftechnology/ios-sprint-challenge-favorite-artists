//
//  NSJSONSerialization+HSVInitModelFromDictionary.m
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import "NSJSONSerialization+HSVInitModelFromDictionary.h"



@implementation NSJSONSerialization (HSVInitModelFromDictionary)


- (void)initWithDictionary:(NSDictionary *)dictionary {
	
	NSString *name = dictionary[@"artists"][0][@"strArtist"];
	NSString *biography = dictionary[@"artists"][0][@"strBiographyEN"];
	long yearFormed = (long)[dictionary[@"artists"][0][@"intFormedYear"] integerValue];
	
	NSLog(@"%@ - %@ %li", name, biography, yearFormed);
}

- (NSDictionary *)toDictionary {
	return @{@"strArtist": @"",
			@"intFormedYear": @"",
			 @"strBiographyEN": @""};
}

@end
