//
//  LSIArtistFetcher.m
//  Favorite_Artistis
//
//  Created by Joe on 8/3/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import "LSIArtistFetcher.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@implementation LSIArtistFetcher

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
                         
                         NSArray *fetchedData = json[@"results"];
            NSMutableArray *fetchedArtists = [[NSMutableArray alloc] init];
            for (NSDictionary *dictionary in fetchedData) {
                LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:dictionary];
                [fetchedArtists addObject:artist];
            }
         }
        self.internalArtists = fetchedArtists;
        
    }];
    [dataTask resume];
}

- (void)fetchArtistdWithCompletionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler
{
    
}

- (void)fetchArtistsInTimeInterval:(nonnull NSDateInterval *)interval completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler
{
    
}



@end
