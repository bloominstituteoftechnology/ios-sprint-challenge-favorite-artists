//
//  LSIArtistController.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "LSIArtistController.h"

@implementation LSIArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalBands = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)fetchArtist:(NSString *)searchTerm {
    
    // Create API request
    
    // Setup the URL
    NSURL *baseURL = @"theaudiodb.com/api/v1/json/1/search.php?s=";
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:searchTerm];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:searchURL];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // Handle the responses (error vs. data)
        
        // Call the completion block as needed
        // check the errors
        
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        
        // Parse the data
        
        //NSLog(@"JSON: %@", json);
        NSArray *Array = json[@"artists"];   // array of Dictionary objects
        
        for (NSDictionary *dict in earthquakeArray) {
            LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:dict];
            
            if (artist) {
                // quakes.append()
                [_internalBands addObject:artist];
            }
        }
        completionBlock(bands, nil);
        
    }];
    [task resume];
    
    
    
}

- (void)addArtist:(LSIArtist *)artist {
    
    // add artist to NSMutableArray _bands
    
    
}

@end
