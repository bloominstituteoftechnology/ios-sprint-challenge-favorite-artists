//
//  CBDArtistFetcher.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDArtistFetcher.h"
#import "CBDArtist.h"

@implementation CBDArtistFetcher

static NSString *baseURLString = @"theaudiodb.com/api/v1/json/1/search.php";
// https://theaudiodb.com/api/v1/json/[key]/[search.php?s={artist name}]

- (void)fetchArtistWithName:(NSString *)name
            completionBlock:(CBDArtistCompletion)completionBlock {
    NSLog(@"Beginning Fetch");
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    //NSString *search = [NSString stringWithFormat:@"search.php\?s=%@", name];
    NSURLQueryItem *searchTerm = [NSURLQueryItem queryItemWithName:@"s" value:name];
    components.queryItems = @[searchTerm];
    //NSURL *url = [baseURL URLByAppendingPathComponent:searchTerm];
    NSURL *url = components.URL;
    
    if (!url) {
        return;
    }
    NSLog(@"URL: %@", url);
    
    
}

@end
