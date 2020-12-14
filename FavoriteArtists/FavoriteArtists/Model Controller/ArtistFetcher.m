//
//  ArtistFetcher.m
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import "ArtistFetcher.h"
#import "FavoriteArtist.h"
#import "LSIFileHelper.h"
#import "FavoriteArtist+Artist_JSON.h"

@interface ArtistFetcher()

@property (nonatomic, copy) NSMutableArray *internalArtists;

@end

@implementation ArtistFetcher

static NSString *ArtistFetcherBaseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";
//@"https://www.theaudiodb.com/api/v1/json/1/search.php?";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
        [self loadFromFileDirectory];
    }
    return self;
}

- (NSArray *)artists {
    return self.internalArtists;
}

- (void) addArtist:(FavoriteArtist *)aritst {
    [self.internalArtists addObject:aritst];
    [self saveToFileDirectory];
}

- (void)fetchArtistWithSearchTerm:(nonnull NSString *)searchTerm
                       completion:(void (^)(FavoriteArtist *,NSError *))completion
{
    NSString *base = [[NSString alloc] initWithFormat:@"%@%@", ArtistFetcherBaseURL, searchTerm];
    NSURL *url = [[NSURL alloc] initWithString:base];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error with URLsession: %@", error);
                completion(nil, error);
                return;
            }
            
            NSError *jsonError = nil;
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError){
                NSLog(@"Error wit jsonSerialization %@", jsonError);
                completion(nil, [[NSError alloc] init]);
                return;
            }
            
            if (![jsonDict isKindOfClass:[NSDictionary class]]) {
                NSLog(@"Class was found nil");
                completion(nil, [[NSError alloc] init]);
                return;
            }
            
            FavoriteArtist *artist = [[FavoriteArtist alloc] initWithDictionary:jsonDict[@"artists"][0]];
            completion(artist, nil);
        }];
        
        [task resume];
}

- (void)saveToFileDirectory {
    NSURL *documentDirectory = [[NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSURL *artistUrl = [documentDirectory URLByAppendingPathComponent:@"artists.json"];
    NSMutableArray *artistDictionary = [[NSMutableArray alloc] init];

    for (FavoriteArtist *favoriteArtist in self.internalArtists) {
        NSDictionary *dictionary = [favoriteArtist toDictionary];
        [artistDictionary addObject:dictionary];
    }
    
    NSData *artisData = [NSJSONSerialization dataWithJSONObject:artistDictionary options:0 error:nil];
    [artisData writeToURL:artistUrl atomically:YES];
}

- (void) loadFromFileDirectory {
    NSURL *documentDirectory = [[NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSURL *favoriteArtistURL = [documentDirectory URLByAppendingPathComponent:@"artists.json"];

    NSData *data = [NSData dataWithContentsOfURL:favoriteArtistURL];
    
    if (data) {
        NSArray *artists = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *artist in artists) {
            FavoriteArtist *object = [[FavoriteArtist alloc] initWithDictionary:artist];
            [self.internalArtists addObject:object];
        }
    }
}

@end
