//
//  TXCArtistController.m
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCArtistController.h"
#import "TXCArtist.h"



@implementation TXCArtistController

static NSString *baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php?s=";

- (void)fetchArtistWithName:(NSString *)name completionBlock:(TXCArtistFetcherCompletionBlock)completionBlock {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    
    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"Artist name" value:name]];
    
    urlComponents.queryItems = queryItems;
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completionBlock(error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(jsonError);
            return;
        }
        
        NSArray *artistArray = json[@"artists"];
        TXCArtist *artist = artistArray[0];
        [self.artists addObject:artist];
       
        
    }];
    [task resume];

}




@end
