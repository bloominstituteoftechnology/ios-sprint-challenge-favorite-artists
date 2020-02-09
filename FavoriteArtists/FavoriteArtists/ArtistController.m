//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Joel Groomer on 2/8/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"
#import "Artist+Artist_NSJSONSerialization.h"

static NSString *const BaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation ArtistController

- (void)addArtist:(Artist *)anArtist
{
    if (![_artists containsObject:anArtist]) {
        [_artists addObject:anArtist];
    }
}

- (void)delArtist:(Artist *)anArtist
{
    [self.artists removeObject:anArtist];
}

- (void)searchForArtistNamed:(NSString *)anArtistName completionHandler:(ArtistSearchCompletionHandler)completionHandler
{
    if (!anArtistName) {
        NSError *error = [[NSError alloc] initWithDomain:[NSURLErrorDomain initWithString:@"No search term"] code:400 userInfo:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(nil, error);
        });
    }
    
    NSURLComponents *URLComponents = [[NSURLComponents alloc] initWithString:BaseURLString];
    NSMutableArray *queryItems = [NSMutableArray arrayWithObject:
                                  [NSURLQueryItem queryItemWithName:@"s" value:anArtistName]];
    URLComponents.queryItems = queryItems;
    NSURL *URL = URLComponents.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error searching for %@: %@", anArtistName, error);
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
        
        NSArray *artistDictionaries = [results objectForKey:@"artists"];
        Artist *foundArtist = [Artist initWithDictionary:artistDictionaries[0]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(foundArtist, nil);
        });
        
    }] resume];
        
}

#pragma mark - Accessors

- (NSArray *)artists {
    return _artists.copy;
}

#pragma mark - Initializers

- (instancetype)init {
    if (self = [super init]) {
        _artists = [[NSMutableArray alloc] init];
    }
    
    return self;
}


@end
