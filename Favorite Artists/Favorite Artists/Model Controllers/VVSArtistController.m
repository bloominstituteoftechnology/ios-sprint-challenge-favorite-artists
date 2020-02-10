//
//  VVSArtistController.m
//  Favorite Artists
//
//  Created by Vici Shaweddy on 2/9/20.
//  Copyright © 2020 Vici Shaweddy. All rights reserved.
//

#import "VVSArtistController.h"
#import "VVSArtist.h"

@interface VVSArtistController ()

@property VVSArtist *searchResult;

@end

@implementation VVSArtistController

static NSString *const baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

- (void)searchForArtist:(NSString *)searchTerm
             completion:(void (^)(VVSArtist *artist, NSError *error))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:searchTerm];
    [components setQueryItems:@[searchItem]];
    
    NSURL *url = [components URL];
    NSLog(@"URL: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // Make request URL session
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // check for error
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data was nil");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil, error);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a top level dictionary as expected");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        // get artist from { "artists": [{...}] }
        NSDictionary *artist = [[json objectForKey:@"artists"] firstObject];
        if (artist == nil) {
            completion(nil, [[NSError alloc] init]);
        }
        
        self.searchResult = [[VVSArtist alloc] initWithDictionary:artist];
        completion(self.searchResult, nil);
    }];
    [task resume];
}

- (NSArray *)fetchFavoritedArtists
{
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
            VVSArtist *artist = [[VVSArtist alloc] initWithDictionary:artistDict];
            [artistsArray addObject:artist];
        }
    }
    
    return artistsArray;
}

@end
