//
//  JACArtistController.m
//  Favorite Artists
//
//  Created by Jordan Christensen on 11/9/19.
//  Copyright © 2019 Mazjap Co. All rights reserved.
//

#import "JACArtistController.h"
#import "JACArtist.h"

@implementation JACArtistController
NSString *baseURLString = @"https://theaudiodb.com/api/v1/json";
NSString *apiKey = @"1";

- (void)fetchArtistByName:(NSString *)name
               completion:(void (^)(JACArtist *artist, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    baseURL = [baseURL URLByAppendingPathComponent:apiKey];
    baseURL = [baseURL URLByAppendingPathComponent:@"search"];
    baseURL = [baseURL URLByAppendingPathExtension:@"php"];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *artistNameItem = [NSURLQueryItem queryItemWithName:@"s" value:[NSString stringWithFormat:@"%@", name]];
    [components setQueryItems:@[artistNameItem]];
    NSURL *url = [components URL];
    NSLog(@"URL: %@", url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
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
            completion(nil, jsonError);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Json was not a top level dictionary as expected");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        JACArtist *artist = [[JACArtist alloc] initWithDictionary:json];
        
        completion(artist, nil);
    }];
    [task resume];
}

- (void)addFavoriteArtist:(JACArtist *)artist {
    [_favoriteArtists addObject:artist];
}

- (void)deleteFavoriteArtist:(long)index {
    [_favoriteArtists removeObjectAtIndex:index];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _favoriteArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
