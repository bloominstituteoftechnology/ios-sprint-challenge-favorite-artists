//
//  SDJArtistClient.m
//  FavoriteArtists
//
//  Created by Shawn James on 6/12/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import "SDJArtistClient.h"
#import "SDJArtist.h"

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation SDJArtistClient

- (void)fetchArtistUsingSearchTerm:(NSString *)name
                  completion:(CompletionHandler)completion {
    // url
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURL];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    NSURL *url = urlComponents.URL;
    if (url == nil) { return; }
    // sessionTask
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:url
                                                       completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        if (data == nil) {
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
        SDJArtist *artistResults = [[SDJArtist alloc] initWithDictionary:artist];
        completion(artistResults, nil);
    }];
    [task resume];
}

- (NSArray *)loadSavedArtistsFromDocumentsDirectory {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    NSArray *filePath = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:documentsDirectory error:nil];
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (NSString *artist in filePath) {
        // /documents/artist
        NSString *artistForPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", artist];
        NSURL *artistURL = [NSURL fileURLWithPath:artistForPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
        SDJArtist *artist = [[SDJArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }
    return artists;
}

@end
