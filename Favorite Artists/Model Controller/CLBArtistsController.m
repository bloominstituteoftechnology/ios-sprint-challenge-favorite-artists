//
//  CLBArtistsController.m
//  Favorite Artists
//
//  Created by Christian Lorenzo on 5/30/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

#import "CLBArtistsController.h"
#import "CLBArtists.h"

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation CLBArtistsController

- (void)fetchArtistsWithName:(NSString *)name completion:(ArtistFetchCompletionHandler)completion {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURL];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    
    NSURL *url = urlComponents.URL;
    
    if (!url) {
        return;
    }
    
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
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
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        if ([dictionary[@"artists"] isKindOfClass:[NSNull class]]) {
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSDictionary *artist = [[dictionary objectForKey:@"artists"] firstObject];
        if (artist == nil) {
            completion(nil, [[NSError alloc] init]);
        }
        
        CLBArtists *artistResults = [[CLBArtists alloc] initWithDictionary:artist];
        completion(artistResults, nil);
    }];
    
    [task resume];
}

- (NSArray *)fetchSavedArtists {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [path objectAtIndex:0];
    NSArray *filePath = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (NSString *artist in filePath) {
        NSString *artistForPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", artist];
        NSURL *artistURL = [NSURL fileURLWithPath:artistForPath];
        
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
        
        CLBArtists *artist = [[CLBArtists alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }
    
    return artists;
}



@end
