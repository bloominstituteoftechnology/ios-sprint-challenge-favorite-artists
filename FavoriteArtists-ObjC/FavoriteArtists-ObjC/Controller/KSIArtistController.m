//
//  KSIArtistController.m
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "KSIArtistController.h"
#import "KSIArtist.h"
#import "KSIArtistResults.h"
#import "LSIErrors.h"

@interface KSIArtistController () {}

@property (nonatomic) NSMutableArray *internalArtists;

@end

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation KSIArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc]init];
        [self loadPersistence];
    }
    return self;
}

- (NSArray *)artists
{
    return [self.internalArtists copy];
}

- (NSUInteger)artistCount
{
    return [self.internalArtists count];
}

- (void)addArtist:(KSIArtist *)anArtist
{
    [self.internalArtists addObject:anArtist];
    [self savePersistence];
}

- (NSURL *)persistentFileURL {
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    NSURL *url = [documentDirectory URLByAppendingPathComponent:fileName];
    NSDictionary *fileUrl = [NSDictionary dictionaryWithContentsOfURL:url];
    NSLog(@"Url: %@", fileUrl);
    return url;
}

- (void)savePersistence
{
    NSURL *url = [self persistentFileURL];
    NSMutableArray *artists = [[NSMutableArray alloc]init];
    
    for (KSIArtist *artist in self.internalArtists) {
        NSDictionary *artistDictioary = [artist dictionaryValue];
        [artists addObject:artistDictioary];
    }
    
    NSData *artistData = [NSJSONSerialization dataWithJSONObject:artists options:0 error:nil];
    [artistData writeToURL:url atomically:YES];
}

- (void)loadPersistence
{
    NSURL *url = [self persistentFileURL];
    NSData *artistData = [NSData dataWithContentsOfURL:url];
    if (artistData != nil) {
        NSArray *artistsArray = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
        for (NSDictionary *favoriteArtistDictionary in artistsArray) {
            KSIArtist *artists = [[KSIArtist alloc]initWithDict:favoriteArtistDictionary];
            [self.internalArtists addObject:artists];
        }
    }
}

- (void)searchForArtists:(NSString *)name
              completion:(ArtistFetcherCompletionHandler)completionHandler
{
    if (!completionHandler) return;
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:ArtistFetcherBaseURLString];
    
    NSURLQueryItem *searchTerm = [NSURLQueryItem queryItemWithName:@"s"
                                                             value:name];
    [urlComponents setQueryItems:@[searchTerm]];
    NSURL *url = urlComponents.URL;
    NSLog(@"Fetching artists from: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url
                               completionHandler:^(NSData * data,
                                                   NSURLResponse * response,
                                                   NSError * error) {
        if (error) {
            NSLog(@"Error fetching artists: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&jsonError];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSError *apiError = errorWithMessage(@"Invalid JSON dictionary", LSIAPIError);
            NSLog(@"Error decoding results dictionary: %@", apiError);
            completionHandler(nil, [[NSError alloc] init]);
            return;
        } else if (dictionary[@"artists"] != [NSNull null]) {
            NSArray *artistDictionaries = dictionary[@"artists"];
            NSDictionary *artistDictionary = artistDictionaries.firstObject;
            KSIArtist *artist = [[KSIArtist alloc] initWithDictionary:artistDictionary];
            
            completionHandler(artist, nil);
        }
    }] resume];
}
@end
