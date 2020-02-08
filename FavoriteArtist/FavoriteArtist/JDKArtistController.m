//
//  JDKArtistController.m
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import "JDKArtistController.h"
#import "JDKArtist.h"
#import "JDKArtist+NSJSONSerialization.h"

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@interface JDKArtistController ()

@property NSMutableArray *internalArtistArray;

@end

@implementation JDKArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtistArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchForArtist:(NSString *)name completionHandler:(JDKArtistSearchCompletionHandler)completionHandler
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    components.queryItems = queryItems;
    NSURL *url = components.URL;
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error getting artist: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"json parsing error: %@", jsonError);
            completionHandler(nil, error);
            return;
        }
        
        NSArray *dictionary = json[@"artists"];
        JDKArtist *artist = [[JDKArtist alloc] initWithDictionary:dictionary[0]];
        completionHandler(artist, nil);
    }];
    
    [task resume];
}

- (void)saveArtist:(JDKArtist *)artist
{
    [self.internalArtistArray addObject:artist];
}

- (JDKArtist *)fetchSavedArtist:(JDKArtist *)artist
{
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:artist.name] URLByAppendingPathExtension:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    JDKArtist *savedArtist = [[JDKArtist alloc] initWithDictionary:dictionary];
    return savedArtist;
}

- (NSMutableArray *)fetchAllSavedArtists
{
    NSArray *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [searchPath objectAtIndex:0];
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];
    
    for (NSString *artist in filePaths) {
        NSString *filePath = [[NSString alloc]initWithFormat:@"Documents/%@", artist];
        NSString *artistPath = [NSHomeDirectory() stringByAppendingPathComponent:filePath];
        
        NSURL *artistURL = [NSURL fileURLWithPath:artistPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        
        if (artistData != nil) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            JDKArtist *artist = [[JDKArtist alloc] initWithDictionary:artistDictionary];
            [self.internalArtistArray addObject:artist];
        } else {
            NSLog(@"Artist Data returned nil");
        }
    }
    return self.internalArtistArray;
}

@end
