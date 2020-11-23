//
//  ArtistFetcher.m
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import "ArtistFetcher.h"
#import "FavoriteArtist.h"
#import "LSIFileHelper.h"
#import "LSIErrors.h"

static NSString *const ArtistFetcherBaseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";

@implementation ArtistFetcher

+ (void)fetchArtistWithSearchTerm:(nonnull NSString *)searchTerm
                completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler
{
    if (!completionHandler) return;
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURL];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"searchValue"
                                                             value:searchTerm],];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"beep beep fetching artist: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"error %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{completionHandler(nil, error);
            });
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!dictionary || ![dictionary isKindOfClass:NSDictionary.class]) {
            NSLog(@"NOOOOO why you no decode: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{completionHandler(nil, jsonError);
            });
            
            return;
        }
        
        FavoriteArtist *results = [[FavoriteArtist alloc] initWithDictionary:dictionary];
        if (!results) {
            NSError *apiError = errorWithMessage(@"Invalid JSON", LSIAPIError);
            NSLog(@"Error decoding Favorite Artists results: %@", apiError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, apiError);
            });
            
            return;
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{completionHandler(results, nil);
        });
    }] resume];
}

@end
