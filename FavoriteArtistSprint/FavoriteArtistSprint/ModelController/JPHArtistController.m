//
//  JPHArtistController.m
//  FavoriteArtistSprint
//
//  Created by Jerry haaser on 1/24/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

#import "JPHArtist+JSONSerialization.h"
#import "JPHArtistController.h"
#import "JPHArtistController.h"
#import "JPHArtist.h"

@interface JPHArtistController()

@property (nonatomic) NSMutableArray *internalArtistArray;

@end

@implementation JPHArtistController

- (instancetype)init {
    if (self = [super init]) {
        _internalArtistArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSMutableArray *)favoriteArtists {
    NSArray *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];
    
    for (NSString *artist in filePaths) {
        NSString *filePath = [[NSString alloc]initWithFormat:@"Documents/%@", artist];
        NSString *artistPath = [NSHomeDirectory()stringByAppendingPathComponent:filePath];
        
        NSURL *artistURL = [NSURL fileURLWithPath:artistPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        
        if (artistData != nil) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            JPHArtist *artist = [[JPHArtist alloc] initWithDictionary:artistDictionary]; [self.internalArtistArray addObject:artist];
        } else {
            NSLog(@"Artist Data returned nil");
        }
    }
    return self.internalArtistArray;
}

static NSString * const baseURLStr = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (void)searchArtistWithName:(NSString *)artistName completion:(void (^)(JPHArtist *artist, NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLStr];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchQuery = [NSURLQueryItem queryItemWithName:@"s" value:artistName];
    [urlComponents setQueryItems:@[searchQuery]];
    
    NSURL *requestURL = urlComponents.URL;
    NSLog(@"URL: %@", requestURL);
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching artist info: %@", error);
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"No data was returned from data task");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError;
        NSDictionary *jsonDict =
        [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if (jsonError) {
            NSLog(@"jsonSerialization error: %@", jsonError);
            completion(nil, jsonError);
            return;
        }
        
        NSArray *artistArray = jsonDict[@"artists"];
            if (artistArray != (id) [NSNull null]) {
                JPHArtist *artist = [[JPHArtist alloc] initWithDictionary:artistArray[0]];
                completion(artist, nil);
            } else {
                NSLog(@"artistArray error: %@", error);
                completion(nil, error);
            }
        }];
        [dataTask resume];
    
}

@end

