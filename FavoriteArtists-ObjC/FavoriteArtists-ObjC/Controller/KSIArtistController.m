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

- (KSIArtist *)artistAtIndex:(NSUInteger)index
{
    return [self.artists objectAtIndex:index];
}

- (void)addArtist:(KSIArtist *)anArtist
{
    [self.internalArtists addObject:anArtist];
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
