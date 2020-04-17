//
//  SAHArtistController.m
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import "SAHArtistController.h"
#import "SAHArtist.h"
#import "SAHArtist+NSJSONSerialization.h"

@interface SAHArtistController ()

@property (nonatomic) NSMutableArray *internalArtist;

@end

@implementation SAHArtistController

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalArtist = [[NSMutableArray alloc] init];
        [self fetchPersistentArtist];
    }
    
    return self;
}

- (NSArray<SAHArtist *> *)favoriteArtists {
    return [_internalArtist copy];
}

- (void)saveArtist:(SAHArtist *)artist {
    [self.internalArtist addObject:artist];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDirectory = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSURL *artistURL = [documentsDirectory URLByAppendingPathComponent:@"FavoriteArtists.json"];
    NSMutableArray<NSDictionary *> *artistsArray = [[NSMutableArray alloc] init];
    for (SAHArtist *artist in self.internalArtist) {
        [artistsArray addObject:[artist toDictionary]];
    }
    
    NSError *jsonError = nil;
    NSData *json = [NSJSONSerialization dataWithJSONObject:artistsArray options:0 error:&jsonError];
    
    if (jsonError == nil) {
        [json writeToURL:artistURL atomically:YES];
    }
    
    
    
}

-(void)fetchPersistentArtist {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDirectory = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSURL *artistURL = [documentsDirectory URLByAppendingPathComponent:@"FavoriteArtists.json"];
    
    NSData *favoritesData = [NSData dataWithContentsOfURL:artistURL];
    
    if (!favoritesData) {
        return;
    }
    
    NSError *jsonError = nil;
    NSArray *favoritesArray = [NSJSONSerialization JSONObjectWithData:favoritesData options:0 error:&jsonError];
    for (NSDictionary *dictionary in favoritesArray) {
        SAHArtist *artist = [[SAHArtist alloc] initWithDictionary:dictionary];
        [self.internalArtist addObject:artist];
    }
    
}

@end
