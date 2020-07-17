//
//  ArtistController.m
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation ArtistController

- (void)fetchArtistsByName:(NSString *)name completion:(ArtistFetcherCompletion)completion {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURL];
    
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s"
                                 value:name.localizedLowercaseString]];
    
    NSURL *requestURL = urlComponents.URL;
    
    if (requestURL == nil) {
        completion(nil, [[NSError alloc] init]);
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession
                                      dataTaskWithRequest:request
                                      completionHandler:^(NSData * _Nullable data,
                                                          NSURLResponse * _Nullable response,
                                                          NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            completion(nil, [NSError alloc]);
            return;
        }
        
        NSError *jsonError = nil;
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:0
                                                                         error:&error];
        
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        Artist *results = [[Artist alloc] initWithDictionary:jsonDictionary];
        completion(results, nil);
        
    }];
    
    [dataTask resume];
}

@end
