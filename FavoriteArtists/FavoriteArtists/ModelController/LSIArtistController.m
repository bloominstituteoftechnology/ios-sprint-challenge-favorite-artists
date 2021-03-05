//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by James McDougall on 3/4/21.
//

#import "LSIArtistController.h"

@implementation LSIArtistController

///  - Initializer -
- (instancetype)init
{
    if (self = [super init]) {
        [self reloadArray];
    }
    return self;
}

//  - Methods -

///  This method will basically create a new instance of the array and refresh it with whatever data resides in the user's documents directory
- (void)reloadArray {
    
    _savedArtists = [[NSMutableArray alloc] initWithArray:@[]];
    NSData *data = [NSData dataWithContentsOfURL:[self documentsURL]];
    if (!data) {
        NSLog(@"ERROR: Data not found!");
        return;
    }
    
    NSError *error = nil;
    NSArray *artistsDictinariesArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        NSLog(@"ERROR: Could not convert JSON into dictionary array! %@", error);
    }
    
    NSMutableArray *artistsArray = [[NSMutableArray alloc] init];
    for (NSDictionary *artistDictionary in artistsDictinariesArray) {
        LSIArtist *fetchedArtist = [[LSIArtist alloc] initWithDecodedDictionary:artistDictionary];
        [artistsArray addObject:fetchedArtist];
    }
    _savedArtists = artistsArray;
}

///  This method will save the artist object passed in, and will update the data residing in the user's documents directory
- (void)saveArtist:(LSIArtist *)artist {
    
    [_savedArtists addObject:artist];
    NSMutableArray *artistsDictinariesArray = [[NSMutableArray alloc] init];
    for (LSIArtist *iteratedArtist in _savedArtists) {
        [artistsDictinariesArray addObject:[iteratedArtist returnDictionary]];
    }
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:artistsDictinariesArray options:0 error:&error];
    if (error) {
        NSLog(@"Could not convert the saved artists into Data! %@", error);
    }
    
    [data writeToURL:[self documentsURL] atomically:true];
}

///  This method will simply return the URL to the user's documents directory
- (NSURL *)documentsURL {
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
    return [documentsDirectoryURL URLByAppendingPathComponent: @"FavoriteArtists.json"];
}

/// - Networking -
- (void)fetchArtistWithSearchTerm:(NSString *)searchTerm completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler {
    
    NSString *adjustedSearchTerm = [searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *requestURLString = [@"https://www.theaudiodb.com/api/v1/json/1/search.php?s=" stringByAppendingString:adjustedSearchTerm];
    NSURL *url = [[NSURL alloc] initWithString:requestURLString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"ERROR: Could not complete the URL reqest or fetch artist");
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        if (!data) {
            NSLog(@"Data not found!");
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"ERROR: Could not convert JSON into dectionary! %@", jsonError);
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        LSIArtist *fetchedArtist = [[LSIArtist alloc] initWithDictionary:dictionary];
        if (fetchedArtist == nil) {
            NSLog(@"ERROR: Could not retrieve artist data, API return NULL!");
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(fetchedArtist, nil);
        });
        
    }]resume];
}

@end
