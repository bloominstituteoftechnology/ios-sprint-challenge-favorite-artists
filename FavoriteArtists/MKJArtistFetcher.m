//
//  MKJArtistFetcher.m
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import "MKJArtistFetcher.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation MKJArtistFetcher

- (instancetype)init
{
    if (self = [super init]) {
        _artists = [NSMutableArray new];
    }
    return self;
}

- (void)fetchArtistWithArtist:(NSString *)artist
            completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s" value:artist]
    ];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"Fetching Artist: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!dictionary || ![dictionary isKindOfClass:NSDictionary.class]) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            
            return;
        }
        
        MKJArtist *result = [[MKJArtist alloc] initWithDictionary:dictionary];
        NSLog(@"Here's the results: %@", result);
        if (!result) {
            NSLog(@"Error decoding results dictionary");
            
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(result, nil);
        });
    }] resume];
}

- (void)saveArtist:(MKJArtist *)artist
{
    NSLog(@"The Artist: %@", artist);
    [_artists addObject:artist];
    NSLog(@"All The Artists: %@", _artists);
}

@end
