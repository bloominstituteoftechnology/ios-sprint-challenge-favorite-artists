//
//  HSVArtist+NSIJsonSerialization.m
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import "HSVArtist+NSIJsonSerialization.h"

@implementation HSVArtist (NSIJsonSerialization)

//
//NSLog(@"%@ - %@ %li", name, biography, yearFormed);


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	self = [super init];
	if(self) {
		NSString *name = dictionary[@"strArtist"];
		NSString *biography = dictionary[@"strBiographyEN"];
		int yearFormed = (int)[dictionary[@"intFormedYear"] integerValue];
		self = [self initWithName:name biography:biography yearFormed:yearFormed];
	}
	return self;
}

- (NSDictionary *)toDictionary {
	NSString *yf = [[NSString alloc] initWithFormat:@"%i", self.yearFormed];
	return @{@"strArtist": self.name,
			 @"strBiographyEN": self.biography,
			 @"intFormedYear": yf
			 };
}

@end
