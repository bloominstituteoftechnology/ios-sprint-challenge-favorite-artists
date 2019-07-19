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

static NSString * const baseUrl = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

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
    NSURL *url = components.URL;

    // Pull artist info
    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    components.queryItems = queryItems;
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            return completionBlock(nil, error);
        }
        
        NSError *jsonError;
        NSDictionary *myDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", error);
            return completionBlock(nil, error);
        }
        
        NSArray *artistDict = myDict[@"artists"];
        if (artistDict == nil) {
            return NSLog(@"No artists found.");
        }
        
        LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistDict[0]];
        completionBlock(artist, nil);
    }];
    [dataTask resume];
}

@end


