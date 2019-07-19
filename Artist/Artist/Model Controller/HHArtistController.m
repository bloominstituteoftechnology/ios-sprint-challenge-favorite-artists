//
//  HHArtistController.m
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import "HHArtistController.h"
#import "HHArtist.h"
#import "HHArtist+HHJSONSerialization.h"

@interface HHArtistController ()

@property (nonatomic, readonly) NSMutableArray *internalArtists;

@end

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@implementation HHArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchArtist:(NSString *)name completionBlock:(HHArtistControllerCompletionBlock)completionBlock {
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    
    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    components.queryItems = queryItems;
    
    NSURL *url = components.URL;
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (!dictionary) {
            NSLog(@"JSON Error: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSArray *artistDictionary = dictionary[@"artists"];
        if (artistDictionary == nil) {
            NSLog(@"No artist returned");
            return;
        }
        
        HHArtist *artist = [[HHArtist alloc] initWithDictionary:artistDictionary[0]];
        completionBlock(artist, nil);
    }];
    [dataTask resume];
}

- (void)addArtist:(HHArtist *)artist {
    [self.internalArtists addObject:artist];
}

- (HHArtist *)fetchSavedArtist:(HHArtist *)artist {
    NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    
    NSURL *aristURL = [[documentDirectory URLByAppendingPathComponent:artist.name] URLByAppendingPathComponent:@"json"];
    
    NSData *artistData = [[NSData alloc] initWithContentsOfURL:aristURL];
    
    NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
    
    HHArtist *savedArtist = [[HHArtist alloc] initWithDictionary:artistDictionary];
    return savedArtist;
}

- (NSMutableArray *)fetchAllSavedArtists {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    
    NSArray *filePathsArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:documentDirectory error:nil];
    
    for (NSString *artistPath in filePathsArray) {
        
        NSString *filePath = [[NSString alloc] initWithFormat:@"Documents/%@", artistPath];
        NSString *artistFilePath = [NSHomeDirectory()stringByAppendingPathComponent:filePath];
        
        NSURL *artistURL = [NSURL fileURLWithPath:artistFilePath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        
        if (artistData) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            HHArtist *artist = [[HHArtist alloc] initWithDictionary:artistDictionary];
            [self.internalArtists addObject:artist];
        } else {
            NSLog(@"artistData is nil.");
        }
    }
    return self.internalArtists;
}

@end
