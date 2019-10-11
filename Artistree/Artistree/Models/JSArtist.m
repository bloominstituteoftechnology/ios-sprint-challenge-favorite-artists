//
//  JSArtist.m
//  Artistree
//
//  Created by Jeffrey Santana on 10/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSArtist.h"

@implementation JSArtist

- (instancetype)initWithDict:(NSDictionary *)artistDict {
	self = [super init];
	if (self) {
		_name = artistDict[@"strArtist"];
		_biography = artistDict[@"strBiographyEN"];
		_yearFormed = [artistDict[@"intFormedYear"] intValue];
	}
	return self;
}

@end
