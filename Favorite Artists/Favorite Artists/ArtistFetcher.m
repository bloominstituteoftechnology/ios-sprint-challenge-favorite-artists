//
//  ArtistFetcher.m
//  Favorite Artists
//
//  Created by Michael Stoffer on 11/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "ArtistFetcher.h"
#import "Artist.h"

#import "Artist+NSJSONSerialization.h"

static NSString *ArtistFetcherBaseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

@interface ArtistFetcher ()

@property (nonatomic) NSMutableArray<Artist *> *internalArtists;

@end


@implementation ArtistFetcher

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchArtist:(NSString *)artist completionHandler:(ArtistFetcherCompletionHandler)completionHandler
{
    NSURLComponents *URLComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];
    
    NSMutableArray *queryItems = [NSMutableArray arrayWithObjects:
                                  [NSURLQueryItem queryItemWithName:@"s" value:artist], nil];
    
    URLComponents.queryItems = queryItems;
    NSURL *URL = URLComponents.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching forecasts: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!results) {
            NSLog(@"Error decoding json: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            
            return;
        }
        
        NSLog(@"%@", results);
        
        NSDictionary *myArtist = [results objectForKey:@"artists"][0];
        
        Artist *newArtist = [[Artist alloc] initWithDictionary:myArtist];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(newArtist, nil);
        });
    }] resume];
}

- (void)loadArtists
{
    NSURL *documentDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"artists.plist"];
    
    NSMutableArray *artistDictionaries = [[NSDictionary alloc] initWithContentsOfURL:documentDirectory][@"artists"];
    
    for (NSDictionary *d in artistDictionaries) {
        Artist *artist = [[Artist alloc] initWithDictionary:d];
        [self.internalArtists addObject:artist];
    }
}

- (void)saveArtist
{
    NSURL *documentDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"artists.plist"];
    
    NSMutableArray *artistDictionaries = [[NSMutableArray alloc] init];
    
    for (Artist *artist in self.internalArtists) {
        [artistDictionaries addObject:[artist toDictionary]];
    }
    
    NSDictionary *d = @{@"artists":artistDictionaries};
    
    [d writeToURL:documentDirectory atomically:YES];
}

- (void)addArtist:(Artist *)aArtist
{
    [self.internalArtists addObject:aArtist];
    [self saveArtist];
}

- (void)removeArtist:(Artist *)aArtist
{
    [self.internalArtists removeObject:aArtist];
    [self saveArtist];
}

- (NSArray<Artist *> *)artists
{
    return [self.internalArtists copy];
}

@end
