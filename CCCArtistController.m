//
//  CCCArtistController.m
//  ios-sprint-challenge-favorite-artists
//
//  Created by Jonalynn Masters on 1/24/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCArtistController.h"
#import "CCCArtist.h"
#import "CCCArtist+CCCNSJSONSerialization.h"

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@interface CCCArtistController ()
@property NSMutableArray *internalArtistsArray;
@end

@implementation CCCArtistController

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalArtistsArray = [[NSMutableArray alloc] init];
    }
    return self;
}



- (void)saveArtist:(CCCArtist *)artist {
    [self.internalArtistsArray addObject:artist];
}


- (CCCArtist *)fetchSavedArtist:(CCCArtist *)artist {
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:artist.name] URLByAppendingPathExtension:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    CCCArtist *savedArtist = [[CCCArtist alloc] initWithDictionary:dictionary];
    return savedArtist;
}



- (NSMutableArray *)fetchAllSavedArtists {
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
            CCCArtist *artist = [[CCCArtist alloc] initWithDictionary:artistDictionary];
            [self.internalArtistsArray addObject:artist];
        } else {
            NSLog(@"Artist Data returned nil");
        }
    }
    return self.internalArtistsArray;
}




- (void)searchForArtist:(NSString *)name completionBlock:(CCCArtistSearchCompletionBlock)completionBlock {
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"s" value:name]
                            ];
    components.queryItems = queryItems;
    NSURL *url = components.URL;
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, error);
            return;
        }
        
        NSArray *dictionary = json[@"artists"];
        CCCArtist *artist = [[CCCArtist alloc] initWithDictionary:dictionary[0]];
        completionBlock(artist, nil);
        
    }];
    
    [task resume];
}



@end
