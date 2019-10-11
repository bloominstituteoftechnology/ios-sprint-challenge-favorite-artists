//
//  JSArtistsController.m
//  Artistree
//
//  Created by Jeffrey Santana on 10/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSArtistsController.h"
#import "JSArtist.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface JSArtistsController ()

@end

@implementation JSArtistsController

//MARK: - Properties

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
	id delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
	if( [delegate performSelector:@selector(persistentContainer)] ){
		context = [[delegate persistentContainer] viewContext];
	}
	return context;
}

- (NSArray *)artists {
	NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Artist"];
    return [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
}

//MARK: - Helpers

- (void)addArtist:(JSArtist *)artist {
	NSManagedObjectContext *context = [self managedObjectContext];
	NSManagedObject *newArtist = [NSEntityDescription insertNewObjectForEntityForName:@"Artist" inManagedObjectContext:context];
	
	[newArtist setValue:artist.name forKey:@"name"];
	[newArtist setValue:artist.biography forKey:@"biography"];
	[newArtist setValue:[NSNumber numberWithInt:artist.yearFormed] forKey:@"yearFormed"];
	
	NSError *error = nil;
	if (![context save:&error]) {
		NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
	}
    
}

- (void)removeArtistAtIndex:(NSUInteger)index {
	NSManagedObjectContext *context = [self managedObjectContext];
	[context deleteObject:[self.artists objectAtIndex:index]];
	
	NSError *error = nil;
	if (![context save:&error]) {
		NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
	}
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
				completion(nil);
				return;
			}
			
			// parse the data
			NSError *jsonError = nil;
			NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
			if (jsonError) {
				NSLog(@"JSON Error: %@", jsonError);
				completion(nil);
				return;
			}
			
			NSLog(@"JSON: %@", json);
			
			NSArray *artists = json[@"artists"];
			if (![artists isKindOfClass:NSNull.self]) {
				NSDictionary *artistDict = artists.firstObject;
				
				JSArtist *artist = [[JSArtist alloc] initWithDict:artistDict];
				
				completion(artist);
			}
			
			completion(nil);
		}];
		[task resume];
}

@end
