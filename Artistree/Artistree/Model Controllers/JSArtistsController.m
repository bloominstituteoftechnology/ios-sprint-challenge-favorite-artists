//
//  JSArtistsController.m
//  Artistree
//
//  Created by Jeffrey Santana on 10/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSArtistsController.h"
#import "JSArtist.h"

@interface JSArtistsController ()

@end

@implementation JSArtistsController

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (instancetype)init
{
	self = [super init];
	if (self) {
		_artists = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)addArtist:(JSArtist *)artist {
	[self.artists addObject:artist];
}

- (void)removeArtistAtIndex:(NSNumber *)index {
	[self.artists removeObject:index];
}

- (void)fetchArtistByName:(NSString *)artistName completion:(myCompletion)completion {
	NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
		
		NSArray *queryItems = @[
			[NSURLQueryItem queryItemWithName:@"s" value:artistName]
		];
		
		urlComponents.queryItems = queryItems;
		
		NSURL *url = urlComponents.URL;
		NSLog(@"URL: %@", url);
		
		NSURLSessionDataTask *task =
		[[NSURLSession sharedSession] dataTaskWithURL:url
									completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
			
			if (error) {
				NSLog(@"Error fetching forecast: %@", error);
				completion(NO);
				return;
			}
			
			// parse the data
			NSError *jsonError = nil;
			NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
			if (jsonError) {
				NSLog(@"JSON Error: %@", jsonError);
				completion(NO);
				return;
			}
			
			NSLog(@"JSON: %@", json);
			
			NSArray *artists = json[@"artists"];
			NSDictionary *artistDict = artists.firstObject;
			JSArtist *artist = [[JSArtist alloc] initWithDict:artistDict];
			
			if (artist) {
				[self addArtist:artist];
			}
			
			completion(YES);
		}];
		[task resume];
}

@end
