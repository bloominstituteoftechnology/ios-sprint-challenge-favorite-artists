//
//  CDGArtistController.m
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import "CDGArtistController.h"
#import "CDGArtist.h"

@interface CDGArtistController()

@property CDGArtist *searchResult;

@end

@implementation CDGArtistController

static NSString *const baserURLString = @"theaudiodb.com/api/v1/json/1/search.php";

- (void)searchForArtist:(NSString *)searchTerm completion:(void (^)(CDGArtist *artist, NSError *error))completion{
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString:baserURLString];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"artist" value:searchTerm]
    ];
    
    NSURL *url = urlComponents.URL;
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error) {
            NSLog(@"Error searching with url: %@", error);
            completion(nil, error);
            return;
        }
        if (!data) {
            NSError *error;
            completion(nil, error);
            return;
        }
        NSError *responseError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:0 error:&responseError];
        if (responseError) {
            completion(nil, error);
            return;
        }
        if (![json isKindOfClass:[NSDictionary class]]){
            completion(nil, [[NSError alloc]init]);
            return;
        }
        NSDictionary *artist = [[json objectForKey:@"artists"] firstObject];
        if (artist == nil ){
            completion(nil, [[NSError alloc]init]);
        }
        self.searchResult = [[CDGArtist alloc] initWithDictionary:artist];
        completion(self.searchResult, nil);
        
    }];
    [task resume];
}


- (void)saveToDirectory:(CDGArtist *)artist {
    if (!artist) {
        return;
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject: [artist toDictionary]
                                                   options:0
                                                     error:nil];
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                              inDomain:NSUserDomainMask
                                                     appropriateForURL:nil
                                                                create:YES
                                                                 error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:artist.artist]URLByAppendingPathExtension:@"json"];
    [data writeToURL:url
          atomically:YES];
}


//NSData *loadFile(NSString *filename, NSBundle *bundle) {
//    NSString *basename = [filename stringByDeletingPathExtension];
//    NSString *extension = [filename pathExtension];
//
//    NSString *path = [bundle pathForResource:basename ofType:extension];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    return data;
//}

- (NSArray *)loadFavoriteArtists{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [path objectAtIndex:0];
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:dir error:nil];
    
    NSMutableArray *artistsArray = [[NSMutableArray alloc] init];
    
    for (NSString *artist in filePaths) {
        NSString *artistPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", artist];
        
        NSURL *artistURL = [NSURL fileURLWithPath:artistPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        if (artistData == nil) {
            NSLog(@"No artist data");
        } else {
            NSDictionary *artistDict = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            CDGArtist *artist = [[CDGArtist alloc] initWithDictionary:artistDict];
            [artistsArray addObject:artist];
        }
    }
    return artistsArray;
}

@end
