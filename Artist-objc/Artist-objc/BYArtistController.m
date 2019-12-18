//
//  BYArtistController.m
//  Artist-objc
//
//  Created by Bradley Yin on 10/11/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

#import "BYArtistController.h"
#import "BYArtist.h"
#import "BYArtist+BYNSJSONSerialization.h"

@implementation BYArtistController


static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _artists = [[NSMutableArray alloc] initWithArray:@[]];
        [self loadArtists];
    }
    return self;
}

- (void)addArtist:(BYArtist *)artist {
    [self.artists addObject: artist];
    [self saveArtists];
}

- (void)saveArtists {
    NSMutableArray *savingArray = [[NSMutableArray alloc] init];
    for (BYArtist *artist in _artists) {
        NSDictionary *dictionary = [artist toDictionary];
        [savingArray addObject:dictionary];
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Artists.plist"];
    NSArray *savingArrayNoMutable = [NSArray arrayWithArray:savingArray];
    bool sucess = [savingArrayNoMutable writeToFile:path atomically:YES];
}


- (void)loadArtists {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Artists.plist"];
    NSArray *artistsArray = [[NSArray alloc] initWithContentsOfFile:path];
    for(NSDictionary *dictionary in artistsArray) {
        BYArtist *artist = [[BYArtist alloc] initWithFileDictionary:dictionary];
        [self.artists addObject:artist];
    }
}

- (void)fetchArtistWithKeyword:(NSString *)keyword completitionBlock:(BYArtistCompletion)completionBlock {
    // Create API request
    
    // Setup the URL
    
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    // Query Parameters
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"s" value:[NSString stringWithFormat:@"%@",keyword]]
                            ];
    
    urlComponents.queryItems = queryItems;
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // Handle the responses (error vs. data)

        // Call the completion block as needed
        // check the errors
        
        if (error) {
            NSLog(@"Error fetching artists: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        // parse the data
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        
        // TODO: Parse the data
        NSLog(@"JSON: %@", json);
        
        if (json[@"artists"] == [NSNull null]) {
            completionBlock(nil, jsonError);
            return;
        }
        
        BYArtist *artist = [[BYArtist alloc] initWithDictionary:json];
        
  
        completionBlock(artist, nil);
        
    }];
    [task resume];
    
    
    
}
@end
