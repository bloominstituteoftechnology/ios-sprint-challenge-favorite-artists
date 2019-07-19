//
//  HSVArtist.m
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import "HSVArtist.h"

@implementation HSVArtist


- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed {
	if (self = [super init]) {
		_name = [name copy];
		_biography = [biography copy];
		_yearFormed = yearFormed;
	}
	return self;
}

@end
