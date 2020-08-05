//
//  SMAFavoriteArtistController.m
//  FavoriteArtists
//
//  Created by Sean Acres on 8/5/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import "SMAFavoriteArtistController.h"
#import "SMAFavoriteArtist+NSJSONSerialization.h"
#import "LSIFileHelper.h"

@interface SMAFavoriteArtistController ()

@property NSMutableArray<SMAFavoriteArtist *> *internalFavoriteArtists;

@end

@implementation SMAFavoriteArtistController

- (instancetype)init
{
    if (self = [super init]) {
        [self loadArtists];
    }
    return self;
}

- (void)addArtist:(SMAFavoriteArtist *)artist
{
    NSLog(@"%@", artist);
    [self.internalFavoriteArtists addObject:artist];
    NSLog(@"%@", self.internalFavoriteArtists);
    [self saveArtists];
    
}

- (NSArray<SMAFavoriteArtist *> *)artists
{
    return _internalFavoriteArtists.copy;
}

- (void)saveArtists
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    for (SMAFavoriteArtist *artist in self.internalFavoriteArtists) {
        dictionary[artist.artistName] = artist.toDictionary;
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingSortedKeys|NSJSONWritingPrettyPrinted error:NULL];
    
    NSURL *url = [[NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject URLByAppendingPathComponent:@"SavedArtists.json" isDirectory:NO];
    
    [data writeToURL:url atomically:YES];
    NSLog(@"Saved to URL: %@", url);
}

- (void)loadArtists
{
    NSMutableArray *loadedArtistsArray = [[NSMutableArray alloc] init];
    
    NSData *data = loadFile(@"SavedArtists.json", NSBundle.mainBundle);
    if (!data) {
        return;
    }
    
    NSError *jsonError = nil;
    NSDictionary *artistsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
    if (!artistsDictionary) {
        NSLog(@"Error with json: %@", jsonError);
    }
    
    if (![artistsDictionary isKindOfClass:NSDictionary.class]) {
        NSLog(@"artistsDictionary isn't a dictionary");
    }
    
    for (NSDictionary *artistDictionary in artistsDictionary) {
        SMAFavoriteArtist *favoriteArtist = [[SMAFavoriteArtist alloc] initWithDictionary:artistDictionary];
        [loadedArtistsArray addObject:favoriteArtist];
    }
    
    self.internalFavoriteArtists = loadedArtistsArray;
}

@end
