//
//  SABArtistFetcher.m
//  FavoriteArtistsSprint
//
//  Created by Stephanie Ballard on 7/17/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

#import "SABArtistFetcher.h"
#import "SABArtistResults.h"
#import "LSIErrors.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation SABArtistFetcher

//Return Artist details from artist name
//search.php?s={Artist name}
//Example - theaudiodb.com/api/v1/json/1/search.php?s=coldplay

-(void)fetchArtistsByName:(NSString *)strArtist
              completions:(SABArtistFetcherCompletion)completion {
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLString];
    
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:strArtist]];
    
    NSURL *requestURL = urlComponents.URL;
    
    if (requestURL == nil) {
        completion(@[], [[NSError alloc] init]);
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(@[], error);
            return;
        }
        
        if (data == nil) {
            NSError *dataError = errorWithMessage(@"Data is nil and results were expected", LSIDataNilError);
            completion(@[],dataError);
            return;
        }
        
        NSError *jsonError = nil;
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (jsonError) {
            completion(@[], jsonError);
            return;
        }
        
        SABArtistResults *results = [[SABArtistResults alloc] initWithDictionary:jsonDictionary];
        completion(results.artists, nil);
    }];
    
    [dataTask resume];
}

@end
