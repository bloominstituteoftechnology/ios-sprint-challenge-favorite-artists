//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "LSIArtistController.h"

@interface LSIArtistController ()



@end

static NSString *baseUrl = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@implementation LSIArtistController

-(instancetype)init {
    self = [super init];
    if (self) {
        _allArtists = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)createArtist:(LSIArtist *)artist {
    [self.allArtists addObject:artist];
}

-(void)fetchArtist:(NSString *)name completionBlock:(LSIArtistControllerCompletionBlock)completionBlock {
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseUrl];
    NSLog(@"HERE: in fetchArtist");

    // Pull artist info
    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    components.queryItems = queryItems;
    
    NSURL *url = components.URL;

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"HERE: in data task");

        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            return completionBlock(nil, error);
        }
        
        if (data) {
            NSError *error = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (error) {
                return completionBlock(nil, error);
            }
            NSArray *resultDict = json[@"artists"];
            
            self.allArtists = [[NSMutableArray alloc] init];
            for (NSDictionary *artistDict in resultDict) {
                LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistDict];
                if (artist) {
                    [self.allArtists addObject:artist];
                }
            }
            completionBlock(self.allArtists, nil);
        }
    }];
    [dataTask resume];
}

@end


