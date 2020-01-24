//
//  LSIArtistController.m
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

@implementation LSIArtistController

static NSString *const baseURLString = @"https://www.theaudiodb.com/api/v1/json/";
static NSString *const apiKey = @"1";

- (instancetype)init {

	self = [super init];
	if (self) {
		_artists = @[];
	}

	return self;
}

- (void)getArtistsFromSearchTerm:(NSString *)searchTerm completion:(void (^)(NSError *, LSIArtist *))completion {

	NSURL *baseURL = [NSURL URLWithString:baseURLString];
	NSURL *url = [[baseURL URLByAppendingPathComponent:apiKey] URLByAppendingPathComponent:@"search.php"];

	NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
	NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:searchTerm];
	[components setQueryItems:@[searchItem]];

	NSURL *searchURL = [components URL];
	NSLog(@"URL: %@", searchURL);
	NSURLRequest *request = [NSURLRequest requestWithURL:searchURL];

	NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			completion(error, nil);
			return;
		}

		if (data == nil) {
			NSLog(@"Data was nil");
			completion([[NSError alloc] init], nil);
			return;
		}

		NSError *jsonError = nil;
		NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		if (jsonError) {
			completion(error, nil);
			return;
		}

		NSArray *artists = json[@"artists"];

		if (artists) {
			NSDictionary *dictionary = artists[0];
			if (dictionary) {
				LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:dictionary];
				if (artist) {
					completion(nil, artist);
					return;
				} else {
					NSLog(@"Could not create artist from dictionary.");
					completion([[NSError alloc] init], nil);
					return;
				}
			}
		}

		NSLog(@"Could not parse returned dictionary.");
		completion([[NSError alloc] init], nil);
	}];

	[task resume];

}


@end
