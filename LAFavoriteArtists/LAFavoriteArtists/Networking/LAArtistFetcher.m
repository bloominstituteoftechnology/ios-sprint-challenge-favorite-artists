//
//  LAArtistFetcher.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LAArtistFetcher.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@implementation LAArtistFetcher

- (void)fetchArtist:(NSString *)name completionBlock:(LAArtistFetcherCompletionBlock)completionBlock{
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString:baseURLString];
    // Query parameters
    NSString *urlString = baseURLString;
    *urlString = [urlString stringByAppendingString: [@"", name]];
}

@end
