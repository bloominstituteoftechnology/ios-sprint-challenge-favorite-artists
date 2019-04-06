//
//  NSJSONSerialization+NYCNSJSONSerialization_Dictionary.m
//  FavArtists
//
//  Created by Nathanael Youngren on 4/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

#import "NSJSONSerialization+NYCNSJSONSerialization_Dictionary.h"

@interface NSJSONSerialization ()

@property (nonatomic) NSMutableData *_Nullable dataRepresentation;

@end

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation NSJSONSerialization (NYCNSJSONSerialization_Dictionary)

+ (void)nyc_fetchArtist:(NSString *)artist completion:(NYCArtistFetcherCompletion)completion {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString: baseURLString];
    
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value: artist]];
    
    NSURLRequest *requestURL = [[NSURLRequest alloc] initWithURL: urlComponents.URL];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching artist. %@", error);
            completion(nil, error);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!dictionary) {
            NSLog(@"Error decoding: %@", error);
            completion(nil, error);
            return;
        }
        
        completion(dictionary, nil);
        return;
    }];
    [task resume];
}

@end
