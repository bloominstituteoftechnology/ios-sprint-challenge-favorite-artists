//
//  LAArtistFetcher.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LAArtistFetcher.h"
#import "LAArtist.h"
#import "LAArtist+NSJSONSerialization.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@implementation LAArtistFetcher

- (void)fetchArtist:(NSString *)name completionBlock:(LAArtistFetcherCompletionBlock)completionBlock{
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString:baseURLString];
    // Query parameters
    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    
    urlComponents.queryItems = queryItems;
    
    //URL
    
    NSURL *url = urlComponents.URL;
    NSLog (@"The URL is: %@", url);
    //DataTask
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Error handling
        if(error){
            NSLog(@"The URL being used: %@", url);
            NSLog(@"Error fetching artist: %@", error);
            return;
        }
        
        // Parse JSON
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if(!dictionary){
            NSLog(@"Error decoding: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        
        NSArray *artistDictionary = dictionary[@"artists"];
        if (artistDictionary == nil){
            NSLog(@"NO ARTIST RETURNED");
            return;
        }
        LAArtist *artist = [[LAArtist alloc]initWithDictionary:artistDictionary[0]];
        completionBlock(artist, nil);
        
    }];
    [task resume];
}

@end
