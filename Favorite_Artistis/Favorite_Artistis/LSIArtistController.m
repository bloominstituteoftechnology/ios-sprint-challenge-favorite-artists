//
//  LSIArtistController.m
//  Favorite_Artistis
//
//  Created by Joe on 8/2/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"
#import "LSIError.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@interface LSIArtistController () {
    NSMutableArray *_internalArtists;
    LSIArtist *_internalArtist;
}
@end

@implementation LSIArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
        [self artists];
        _internalArtist = [[LSIArtist alloc] init];
        [self artist];
    }
    return self;
}

- (void)searchForArtists:(NSString *)searchItem completion:(ArtistFetcherCompletionHandler)completion
{
    searchItem = [searchItem stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString *searchURL = [ArtistFetcherBaseURLString stringByAppendingString: searchItem];
    NSURL *baseURL = [NSURL URLWithString:searchURL];
    NSLog(@"baseURL");
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil, error);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a Dictionary as expected");
            completion(nil, [[NSError alloc] init]);
        }
        
        NSArray *fetchedData = json[@"artists"];
        LSIArtist *newArtist = [[LSIArtist alloc] init];
        
        for (NSDictionary *dictionary in fetchedData) {
            LSIArtist *myArtist = [[LSIArtist alloc] initWithDictionary:dictionary];
            myArtist.artistName = dictionary[@"strArtist"];
            myArtist.artistInfo = dictionary[@"strBiographyEN"];
            myArtist.yearFormed = dictionary[@"intFormedYear"];
            
            newArtist = myArtist;
        }
        
        completion(newArtist, nil);
    }];
    [dataTask resume];
}

- (void)addArtist:(LSIArtist *)anArtist
{
    [_internalArtists addObject:anArtist];
}

@end
