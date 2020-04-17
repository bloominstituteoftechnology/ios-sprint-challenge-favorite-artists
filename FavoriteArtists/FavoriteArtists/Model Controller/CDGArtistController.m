//
//  CDGArtistController.m
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import "CDGArtistController.h"
#import "CDGArtist.h"

@interface CDGArtistController()

@property CDGArtist *searchResult;

@end

@implementation CDGArtistController

static NSString const *baserURLString = @"theaudiodb.com/api/v1/json/1/search.php";

- (void)searchForArtist:(NSString *)searchTerm completion:(void (^)(CDGArtist *artist, NSError *error))completion{
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString:baserURLString];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"artist" value:searchTerm]
    ];
    
    NSURL *url = urlComponents.URL;
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"url: %@", url);
        
        if(error) {
            NSLog(@"Error searching with url: %@", error);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSError *error;
            completion(nil, error);
            return;
        }
        
    }];
    [task resume];
}

- (NSArray *)fetchFavoriteArtists {
  
}


@end
