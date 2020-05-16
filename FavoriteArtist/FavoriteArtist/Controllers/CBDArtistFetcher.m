//
//  CBDArtistFetcher.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDArtistFetcher.h"
#import "CBDArtist.h"
#import "CBDArtist+NSJSONSerialization.h"

@implementation CBDArtistFetcher

static NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";
// https://theaudiodb.com/api/v1/json/[key]/[search.php?s={artist name}]

- (instancetype)initWithArtists:(NSMutableArray *)artists {
    self = [super init];
    if (self) {
        _artists = artists;
    }
    return self;
}

- (void)fetchArtistWithName:(NSString *)name
            completionBlock:(CBDArtistCompletion)completionBlock {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchTerm = [NSURLQueryItem queryItemWithName:@"s" value:name];
    components.queryItems = @[searchTerm];
    NSURL *url = components.URL;
    
    if (!url) {
        return;
    }
    
    //NSLog(@"URL: %@", url);
    
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                              
        if (error) {
            completionBlock(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"No data from network");
            completionBlock(nil, nil);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completionBlock(nil, jsonError);
            return;
        }
        
        //NSLog(@"dictionary");
        CBDArtist *artist = [[CBDArtist alloc] initWithDictionary:dictionary];
        if (artist) {
            //[self.artists addObject:artist];
            completionBlock(artist, nil);
            return;
        }
        completionBlock(nil, nil);
    }];
    [task resume];
}

- (void)saveArtist:(CBDArtist *)artist
   completionBlock:(CBDArtistCompletion)completionBlock {
    [self.artists addObject:artist];
    completionBlock(nil, nil);
    [self saveToDisk];
}

- (void)saveToDisk {
    NSArray *urls = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [urls objectAtIndex:0];
    NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"artists.txt"];

    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < self.artists.count; i++) {
        [dictionary setValue:[self.artists[i] toDictionary] forKey:self.artists[i].strArtist];
        //dictionary[self.artists[i].strArtist] = [self.artists[i] toDictionary];
    }
    //[artistDictionary setValue:self.artists forKey:@"artists"];
    [dictionary writeToFile:fileName atomically:YES];

    NSLog(@"File: %@", fileName);
}

- (void)loadFromDisk {
    NSArray *urls = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [urls objectAtIndex:0];
    NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"artists.txt"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:fileName];
    
    for (id key in dictionary) {
        NSDictionary *artistEntry = dictionary[key];
        CBDArtist *artist = [[CBDArtist alloc] initWithLocalDictionary:artistEntry];
        [self.artists addObject:artist];
    }
    
    NSLog(@"Dictionary: %@", self.artists);
}

@end
