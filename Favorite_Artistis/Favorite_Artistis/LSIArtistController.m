//
//  LSIArtistController.m
//  Favorite_Artistis
//
//  Created by Joe on 8/2/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@interface LSIArtistController ()
    @property NSMutableArray *internalArtists;

@end

@implementation LSIArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
        [self artists];
    }
    return self;
}

- (NSUInteger)artistCount
{
    return [_internalArtists count];  // Access the amount of tips that exist.
}

- (void)addArtist:(LSIArtist *)anArtist
{
    [_internalArtists addObject:anArtist];
}

- (void)searchForPeople:(void (^)(NSError *error))completion
{
    NSURL *baseURL = [NSURL URLWithString:ArtistFetcherBaseURLString];
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession
                                      dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(error);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil);
            return;
        }
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected");
            completion([[NSError alloc]init]);
        }
            NSArray *fetchedData = json[@"results"];
            NSMutableArray *fetchedArtists = [[NSMutableArray alloc] init];
        
            for (NSDictionary *dictionary in fetchedData) {
                LSIArtist *artist = [[LSIArtist  alloc] initWithDictionary:dictionary];
                [fetchedArtists addObject:artist];
            }
         
        self.internalArtists = fetchedArtists;
        completion(nil);
    }];
    [dataTask resume];
}


@end
