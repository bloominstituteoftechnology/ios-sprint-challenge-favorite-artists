//
//  BRDArtistController.m
//  My Favorite Artist
//
//  Created by Bradley Diroff on 6/12/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

#import "BRDArtistController.h"
#import "BRDArtist.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation BRDArtistController

- (void)fetchArtistWithName:(NSString *)name
            completionBlock:(BRDArtistFetcherCompletion)completionBlock {
    NSLog(@"Now fetching artists");
                
    NSURLComponents * urlComponrnts = [NSURLComponents componentsWithString:baseURLString];
    urlComponrnts.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:name]
    ];
    
    NSURL * url = urlComponrnts.URL;
    
    if (!url) {
        return;
    }
    
    NSURLSessionTask * task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completionBlock(nil, error);
            return;
        }
        
        if (!data) {
            NSError *dataError = error;
            completionBlock(nil, dataError);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) {
            completionBlock(nil, jsonError);
            return;
        }
        
        if ([dictionary[@"artists"] isKindOfClass:[NSNull class]]) {
            completionBlock(nil, [[NSError alloc] init]);
            return;
        }

        NSDictionary *artist = [[dictionary objectForKey:@"artists"] firstObject];
        if (artist == nil) {
            completionBlock(nil, [[NSError alloc] init]);
        }
    
        BRDArtist *artistResults = [[BRDArtist alloc] initWithDictionary:artist];
        completionBlock(artistResults, nil);
        
    }];
    [task resume];
}

- (NSArray *)fetchSavedArtists {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [path objectAtIndex:0];
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (NSString *artist in filePaths) {
        NSString *artistDirPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", artist];
        NSURL *artistURL = [NSURL fileURLWithPath:artistDirPath];
        
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        NSDictionary *artistDictionary = [NSJSONSerialization
                                          JSONObjectWithData:artistData
                                          options:0
                                          error:nil];
        
        BRDArtist *artist = [[BRDArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }
    
    return artists;
}

@end
