//
//  NSJSONSerialization+JDFArtistFetcher.m
//  Favorite Artists
//
//  Created by Jonathan Ferrer on 7/19/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

#import "NSJSONSerialization+JDFArtistFetcher.h"

@interface NSJSONSerialization ()

@property (nonatomic) NSMutableData *_Nullable dataRepresentation;

@end

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation NSJSONSerialization (JDFArtistFetcher)

+ (void)fetchArtist:(NSString *)artist completion:(JDFArtistFetchCompletionBlock)completion {

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString: baseURLString];

    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value: artist]];

    NSURLRequest *requestURL = [[NSURLRequest alloc] initWithURL: urlComponents.URL];

    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error. %@", error);
            completion(nil, error);
            return;
        }

        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (!dictionary) {
            NSLog(@"Error: %@", error);
            completion(nil, error);
            return;
        }

        completion(dictionary, nil);
        return;
    }];
    [task resume];
}
@end
