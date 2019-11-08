//
//  JLCArtistController.m
//  Favorite-Artists-ST
//
//  Created by Jake Connerly on 11/8/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

#import "JLCArtistController.h"
#import "JLCArtist.h"

@interface JLCArtistController ()

@property (nonatomic, readwrite) NSMutableArray *internalArtists;

@end

@implementation JLCArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addFavoriteArtist:(JLCArtist *)artist {
    [self.internalArtists addObject:artist];
}

- (NSArray *)favoriteArtist {
    return [self.internalArtists copy];
}

static NSString *const baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

- (void)searchForArtistWithArtistName:(NSString *)artistName
                           completion:(void (^)(JLCArtist *artist, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *artistToSearch = [NSURLQueryItem queryItemWithName:@"s" value:artistName];
    [components setQueryItems:@[artistToSearch]];
    
    NSURL *url = [components URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request
        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (!data) {
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, error);
            return;
        }
        
        if(![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a top lvel dictionary as expected");
            completion(nil, [[NSError alloc] init]);
        }
        
        NSArray *artistsResults = json[@"artists"];
        NSDictionary *artistDictionary = [artistsResults firstObject];
        JLCArtist *artist = [[JLCArtist alloc] initWithDictionary:artistDictionary];
        
        completion(artist, nil);
    }];
    [task resume];
}

@end
