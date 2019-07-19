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

@property (nonatomic, copy) NSMutableArray *internalArtists;

@end

@implementation HSVArtistsController

static NSString *baseUrl = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s="; // Morrissey";

- (instancetype)init
{
	self = [super init];
	if (self) {
		_internalArtists = [[NSMutableArray alloc] init];
	}
	return self;
}

- (NSArray *)artists {
	return self.internalArtists;
}

- (void)fetchArtistWithName:(NSString *)name completion:(void (^)(NSError *))completion{
	
	NSString *base = [[NSString alloc] initWithFormat:@"%@%@", baseUrl, name];
	NSURL *url = [[NSURL alloc] initWithString:base];
	NSLog(@"%@", url);
	
	NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			NSLog(@"error with url session: %@", error);
			completion(error);
			return;
		}
		
		NSError *jsonError = nil;
		NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		
		if (jsonError){
			NSLog(@"Error wit jsonSerialization %@", jsonError);
			completion(jsonError);
			return;
		}

		NSLog(@"%@", jsonDict[@"artists"][0][@"strArtist"]);
		NSLog(@"%li", (long)[jsonDict[@"artists"][0][@"intFormedYear"] integerValue]);
		NSLog(@"%@", jsonDict[@"artists"][0][@"strBiographyEN"]);
		
	}];
	[task resume];
}




@end
