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
        
        Artist *results = [[Artist alloc] initWithSearchResults:dictionary];
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

- (NSString *)filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = paths[0];
    path = [path stringByAppendingPathComponent:@"artists"];
    path = [path stringByAppendingPathExtension:@"json"];
    return path;
}

- (void)saveToPersistentStore {
    NSString *artistKey = @"artist";
    NSString *artistPath = [self filePath];
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (Artist *artist in self.artists) {
        NSDictionary *artistDict = artist.dictionaryValue;
        [artists addObject:artistDict];
    }
    
    NSDictionary *dict = @{artistKey : artists};
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    NSURL *urlPath = [NSURL fileURLWithPath:artistPath];
    [data writeToURL:urlPath atomically:YES];
    
}

- (void)loadFromPersistentStore {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *artistKey = @"artist";
    NSString *artistPath = [self filePath];
    
    if ([fileManager fileExistsAtPath:artistPath]) {
        NSURL *urlPath = [NSURL fileURLWithPath:artistPath];
        NSData *data = [NSData dataWithContentsOfURL:urlPath];
        NSError *error = nil;
        NSMutableDictionary *artistDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *artistArray = artistDict[artistKey];
        for (NSMutableDictionary *dict in artistArray) {
            Artist *artist = [[Artist alloc] initFromStore:dict];
            [self.artists addObject:artist];
        }
    }
}

@end
