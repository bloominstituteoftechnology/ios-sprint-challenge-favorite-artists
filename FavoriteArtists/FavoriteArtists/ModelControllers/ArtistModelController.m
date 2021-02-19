//
//  ArtistModelController.m
//  FavoriteArtists
//
//  Created by John McCants on 2/18/21.
//

#import "ArtistModelController.h"
#import "Artist.h"

static NSString *const baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";

@implementation ArtistModelController

-(instancetype)init
{
    if (self = [super init]) {
        _artists = [[NSMutableArray alloc] init];
        
    }
    return self;
}

+ (void)fetchArtist:(NSString *)searchTerm completionHandler:(ArtistCompletion)completionHandler
{
    if (!completionHandler) return;
    
    NSLog(@"1. Fetch Artists function starting");
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc]initWithString:baseURLString];
    
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:searchTerm]];
    
    NSURL *url = urlComponents.URL;
    
    NSLog(@"2. URL: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url
                                  completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    NSLog(@"3. Starting URL Session DataTaskWithURL");
        
            if (error) {
                NSLog(@"Error fetching artist: %@", error);
                return;
            }
            NSError *jsonError;
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            Artist *result = [[Artist alloc] initWithSearchResults:dictionary];
            if (!result) {
                NSLog(@"No Decoding Dictionary");
            }
        
        NSLog(@"%@", result.artistName);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(result, nil);
        });

            
        }] resume];
    
    
}

@end
