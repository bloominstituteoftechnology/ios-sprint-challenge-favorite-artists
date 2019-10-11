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


@implementation REPArtistNetController

//static NSString const *baseURLString = @"https://theaudiodb.com/api/v1/json/{APIKEY}/search.php?s={Artist name}";
static NSString const *baseURLString = @"https://theaudiodb.com/api/v1/json/";
static NSString const *apiKey = @"f641060b2a95d6cca0d96a5230be574b";

- (void)fetchArtistNamed:(NSString *)name completionBlock:(REPArtistCompletionBlock)completionBlock {

	NSURL *baseURL = [NSURL URLWithString:baseURLString];
	NSURL *apiKeyURL = [baseURL URLByAppendingPathComponent:@"1"];
	NSURL *requestURL = [[apiKeyURL URLByAppendingPathComponent:@"search"] URLByAppendingPathExtension:@"php"];

	NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:@"s" value:name];
	NSURLComponents* components = [NSURLComponents componentsWithURL:requestURL resolvingAgainstBaseURL:NO];
	components.queryItems = @[queryItem];

	NSURL* url = components.URL;

	NSLog(@"%@", url);

}

@end
