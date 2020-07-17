//
//  DBEArtistFetcher.m
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import "DBEArtistFetcher.h"
#import "DBEArtist.h"
#import "DBEErrors.h"
#import "DBEArtist+NSJSONSerialization.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@implementation DBEArtistFetcher

- (void)fetchArtist:(NSString *)name completion:(DBEArtistFetchCompletion)completion {
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString:baseURLString];
    
    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    
    urlComponents.queryItems = queryItems;
    
    NSURL *requestURL = urlComponents.URL;
    
    if (!requestURL) {
        return;
    }

    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithRequest:request
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSError *dataError = error;
            completion(nil, dataError);
            return;
        }
        
        NSError *jsonError = nil;
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&jsonError];
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        NSArray *artistDictionary = jsonDictionary[@"artists"];
        if (artistDictionary == nil) {
            NSLog(@"Error fetching artists");
            return;
        }
        
        DBEArtist *artist = [[DBEArtist alloc]initWithDictionary:artistDictionary[0]];
        completion(artist, error);
    }];
    [dataTask resume];
}

@end
