//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import "ArtistController.h"
#import "Artist.h"
#import "LSIErrors.h"

static NSString *const artistSearchBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";

@implementation ArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _artists = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (void)searchArtistsWithSearchTerm:(nonnull NSString *)searchTerm
                completionHandler:(nonnull ArtistControllerCompletionHandler)completionHandler
{
    if (!completionHandler) return;

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:artistSearchBaseURLString];

    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:searchTerm],
    ];

    NSURL *url = urlComponents.URL;
    NSLog(@"Fetching Artists: %@", url);

    [[NSURLSession.sharedSession dataTaskWithURL:url
                               completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&jsonError];
        if (!dictionary || ![dictionary isKindOfClass:NSDictionary.class]) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            
            return;
        }
        
        Artist *results = [[Artist alloc] initWithDictionary:dictionary];
        if (!results) {
            NSError *apiError = errorWithMessage(@"Invalid JSON Dictionary", LSIAPIError);
            NSLog(@"Error decoding results dictionary: %@", apiError.localizedDescription);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, apiError);
            });
            
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(results, nil);
        });
    }] resume];
}

@end
