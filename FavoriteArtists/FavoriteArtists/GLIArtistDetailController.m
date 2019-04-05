//
//  GLIArtistDetailController.m
//  FavoriteArtists
//
//  Created by Julian A. Fordyce on 4/5/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import "GLIArtistDetailController.h"
#import "GLIArtistDetail.h"

NSString *baseURL = @"https://theaudiodb.com/api/v1/json/1/search.php";

@implementation GLIArtistDetailController

- (void)fetchArtistDetailsWithCompletionBlock:(NSString *)name completion:(void (^)(NSError *))completionBlock
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURL];
    NSMutableArray *queryItems = [@[[NSURLQueryItem queryItemWithName:@"s" value:name]] mutableCopy];
    
    urlComponents.queryItems = queryItems;
    NSURL *url = urlComponents.URL;

        
}

@end
