//
//  SLRFetchArtist.m
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import "SLRFetchArtist.h"
#import "SLRArtist.h"
#import "SLRArtist+NSJSONSerialization.h"

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?=";

@class SLRArtist;

@interface SLRFetchArtist()

// This is where the API data will be stored.  Must be mutable.
@property (nonatomic) NSMutableArray *internalArtistArray;

@end

@implementation SLRFetchArtist

- (instancetype)init {
    
    if (self = [super init]) {
        _internalArtistArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSMutableArray *)artistArray {
    NSArray *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [searchPath objectAtIndex:0];
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];
    
    for (NSString *artist in filePaths) {
        NSString *filePath = [[NSString alloc]initWithFormat:@"Documents/%@", artist];
        NSString *artistPath = [NSHomeDirectory()stringByAppendingPathComponent:filePath];
        
        NSURL *artistURL = [NSURL fileURLWithPath:artistPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        
        if (artistData != nil) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            SLRArtist *artist = [[SLRArtist alloc] initWithDictionary:artistDictionary];
            [self.internalArtistArray addObject:artist];
        } else {
            NSLog(@"Artist Data returned nil");
        }
    }
    return self.internalArtistArray;
}

- (void)fetchArtistsByName:(NSString*)name completionBlock:(SLRCompletionBlock)completionBlock {
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURL];
    // Define query item

    NSArray *queryItems = @[ [NSURLQueryItem queryItemWithName:@"s" value:name] ];
    urlComponents.queryItems = queryItems;
    
    // Create the URL
    NSURL *url = urlComponents.URL;

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching artist from dataTask: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError){
            NSLog(@"JsonSerialization error: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        
        // Make sure the artist was found
        NSArray *jsonDict = json[@"artists"];
        if (jsonDict != (id) [NSNull null]) {
            SLRArtist *artist = [[SLRArtist alloc] initWithDictionary: jsonDict[0]];
            completionBlock(artist, nil);
        } else {
           NSLog(@"jsonDict error: %@", error);
           completionBlock(nil, error);
        }
    }];
    
    [dataTask resume];
}

@end

