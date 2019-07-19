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

- (void) addArtist:(HSVArtist *)aritst {
	[self.internalArtists addObject:aritst];
	[self saveToFileDirectory];
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
			completion(nil, [[NSError alloc] init]);
			return;
		}
		
		if (![jsonDict isKindOfClass:[NSDictionary class]]) {
			NSLog(@"found nil");
			completion(nil, [[NSError alloc] init]);
			return;
		}
		
		HSVArtist *artist = [[HSVArtist alloc] initWithDictionary:jsonDict];
		completion(artist, nil);
		[self addArtist:artist];

	}];
	
	[task resume];
}

- (void)saveToFileDirectory {
	NSURL *documentDirectory = [[NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
	NSURL *artistUrl = [documentDirectory URLByAppendingPathComponent:@"artists.json"];
	NSMutableArray *artistDictionary = [[NSMutableArray alloc] init];

	for (HSVArtist *artist in self.internalArtists) {
		NSDictionary *dict = [artist toDictionary];
		[artistDictionary addObject:dict];
	}
	
	NSData *artisData = [NSJSONSerialization dataWithJSONObject:artistDictionary options:0 error:nil];
	[artisData writeToURL:artistUrl atomically:YES];
}





@end
