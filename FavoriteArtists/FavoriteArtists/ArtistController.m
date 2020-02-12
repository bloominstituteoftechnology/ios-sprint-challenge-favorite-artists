//
//  ArtistController.m
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import "ArtistController.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"


static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@class ArtistDetailViewController;

@interface ArtistController ()

@property (nonatomic) NSMutableArray<Artist *> *internalArtists;
@property (nonatomic, readonly) ArtistDetailViewController *artistDetailVC;

@end

@implementation ArtistController

//MARK: - Initializers

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

//MARK: - Methods

- (void)addArtist:(Artist *)anArtist
{
    [_internalArtists addObject:anArtist];
}

- (void)removeArtist:(Artist *)anArtist
{
    [_internalArtists removeObject:anArtist];
}

- (NSArray<Artist *> *)artists
{
    return _internalArtists.copy;
}


- (void)fetchArtistWithSearchTerm:(NSString *)searchTerm
                completionHandler:(ArtistFetcherCompletionHandler)completionHandler
{
    
    NSString *realURL = [ArtistFetcherBaseURLString stringByAppendingString:searchTerm];
    NSURLComponents *URLComponents = [[NSURLComponents alloc] initWithString:realURL];
    NSURL *URL = URLComponents.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!results) {
            NSLog(@"Error decoding json: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            
            return;
        }
        
        NSArray *artistDictionaries = [results objectForKey:@"artists"];
        
        
        for (NSDictionary *dictionary in artistDictionaries) {
            Artist *artist = [[Artist alloc] initWithDictionary:dictionary];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(artist, nil);
            });
        }
        
    }] resume];
}


@end
