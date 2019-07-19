//
//  HSVArtistsController.m
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import "HSVArtistsController.h"
#import "../Models/HSVArtist.h"

@interface HSVArtistsController()

@property (nonatomic, copy) NSMutableArray *_internalArtists;

@end

@implementation HSVArtistsController

static NSString *baseUrl = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s="; // Morrissey";

- (instancetype)init
{
	self = [super init];
	if (self) {
		__internalArtists = [[NSMutableArray alloc] init];
	}
	return self;
}

- (NSArray *)artists {
	return self._internalArtists;
}

- (void)fetchArtistWithName:(NSString *)name completion:(void (^)(NSError *))completion{
	
	NSString *base = [[NSString alloc] initWithFormat:@"%@%@", baseUrl, name];
	NSURL *url = [[NSURL alloc] initWithString:base];
	NSLog(@"%@", url);
}




@end
