//
//  REPArtistController.m
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPArtistNetController.h"
#import "REPArtist+NSJSONSerialization.h"
#import "REPArtist+REPConvenience.h"
#import "REPCoreDataStack.h"


@implementation REPArtistNetController

//static NSString const *baseURLString = @"https://theaudiodb.com/api/v1/json/{APIKEY}/search.php?s={Artist name}";
static NSString const *baseURLString = @"https://theaudiodb.com/api/v1/json/";
static NSString const *apiKey = @"1";

- (void)fetchArtistNamed:(NSString *)name completionBlock:(REPArtistCompletionBlock)completionBlock {

	NSURL *baseURL = [NSURL URLWithString:baseURLString];
	NSURL *apiKeyURL = [baseURL URLByAppendingPathComponent:apiKey];
	NSURL *requestURL = [[apiKeyURL URLByAppendingPathComponent:@"search"] URLByAppendingPathExtension:@"php"];

	NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"s" value:name];
	NSURLComponents* components = [NSURLComponents componentsWithURL:requestURL resolvingAgainstBaseURL:NO];
	components.queryItems = @[queryItem];

	NSURL* url = components.URL;

	NSURLSessionDataTask *fetchTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			NSLog(@"error fetching data: %@", error);
			completionBlock(nil, error);
			return;
		}

		NSError* decodeError;
		NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&decodeError];
		NSArray *artistResults = jsonDict[@"artists"];
		NSDictionary *firstArtist = [artistResults firstObject];

		if (decodeError) {
			NSLog(@"error decoding data: %@", decodeError);
			completionBlock(nil, decodeError);
			return;
		}

		NSManagedObjectContext *newContext = [[REPCoreDataStack sharedInstance].container newBackgroundContext];

		REPArtist *artist = [REPArtist artistWithDictionary:firstArtist onContext:newContext];

		completionBlock(artist, nil);

	}];
	[fetchTask resume];

}

@end
