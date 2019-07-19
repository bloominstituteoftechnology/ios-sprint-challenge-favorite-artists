//
//  HSVArtistsController.m
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import "HSVArtistsController.h"
#import "../Models/HSVArtist.h"
#import "../Category/HSVArtist+NSIJsonSerialization.h"

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

- (void) createArtistWithName:(NSString *)name biography:(NSString *)bio yearFormed:(int)formedYear {
	HSVArtist *artist = [[HSVArtist alloc] initWithName:name biography:bio yearFormed:formedYear];
	
	[self.internalArtists addObject:artist];
	//save to file
}

- (void)fetchArtistWithName:(NSString *)name completion:(void (^)(HSVArtist *,NSError *))completion{
	NSString *base = [[NSString alloc] initWithFormat:@"%@%@", baseUrl, name];
	NSURL *url = [[NSURL alloc] initWithString:base];
	
	NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			NSLog(@"error with url session: %@", error);
			completion(nil, error);
			return;
		}
		
		NSError *jsonError = nil;
		NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		
		if (jsonError){
			NSLog(@"Error wit jsonSerialization %@", jsonError);
			completion(nil, jsonError);
			return;
		}
		
		HSVArtist *artist = [[HSVArtist alloc] initWithDictionary:jsonDict];
		completion(artist, nil);
		
//		[self createArtistWithName:name biography:bio yearFormed:formedYear];
//		NSLog(@"%@", artist.name);
	}];
	
	[task resume];
}


@end
