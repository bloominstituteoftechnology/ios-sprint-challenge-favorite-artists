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
		NSString *name = dictionary[@"artists"][0][@"strArtist"];
		NSString *biography = dictionary[@"artists"][0][@"strBiographyEN"];
		int yearFormed = (int)[dictionary[@"artists"][0][@"intFormedYear"] integerValue];
		self = [self initWithName:name biography:biography yearFormed:yearFormed];
	}
	return self;
}

- (NSDictionary *)toDictionary {
	
	
	
	return nil;
}

@end
