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

static NSString *baseURL = @"https://theaudiodb.com/api/v1/json/1/search.php";

@implementation ArtistController

- (void)fetchArtistsByName:(NSString *)name completion:(ArtistFetcherCompletion)completion {

    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURL];
    
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s"
                                 value:name.lowercaseString]];
    
    NSURL *requestURL = urlComponents.URL;
    //NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    
    if (!requestURL) {
        NSLog(@"Request URL Invalid");
        completion(nil, [[NSError alloc] init]);
    }
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession
                                      dataTaskWithURL: requestURL
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
                                                                         error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        NSDictionary *dict = [jsonDictionary[@"artists"] firstObject];
        
        Artist *results = [[Artist alloc] initWithDictionary:dict];
        completion(results, nil);
        
    }];
    
    [dataTask resume];
}

- (NSMutableArray *)loadSavedArtists {
    NSMutableArray *artistsArray = [[NSMutableArray alloc] init];
    
    NSURL *documentDir = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    NSURL *documentsURL = [documentDir URLByAppendingPathComponent:@"artists"];
    
    NSData *data = [NSData dataWithContentsOfURL:documentsURL];
    
    if (!data) {
        return artistsArray;
    }
    
    NSMutableArray *artists = [NSJSONSerialization JSONObjectWithData:data
                                                       options:0
                                                         error:nil];
    
    for (NSDictionary *dict in artists) {
        [artistsArray addObject:[[Artist alloc] initWithDictionary:dict]];
    }
    return artistsArray;
}

- (void)save:(Artist *)artist {
    NSMutableArray *locallySaved = [self loadSavedArtists];
    
    NSMutableArray *newSave = [[NSMutableArray alloc] init];
    
    for (Artist *a in locallySaved) {
        [newSave addObject:[a toDictionary]];
    }
    
    [newSave addObject:[artist toDictionary]];
//    [locallySaved addObject:[artist toDictionary]];
    
    NSURL *documentDir = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    NSURL *documentsURL = [documentDir URLByAppendingPathComponent:@"artists"];
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:newSave
                                                   options: 0
                                                     error: nil];
    
    [data writeToURL:documentsURL
          atomically:YES];
}

@end
