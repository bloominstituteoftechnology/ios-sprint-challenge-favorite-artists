//
//  WASArtistController.m
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 6/11/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import "WASArtistController.h"
#import "WASArtist.h"
#import "NSObject+WASArtist_NSJSONSerialization.h"

@interface WASArtistController()

@property (nonatomic) NSMutableArray *archive;

@end

@implementation WASArtistController

- (instancetype)init {
    self = [super init];
    if (self) {
        _archive = [[NSMutableArray alloc] init];
    }
    return self;
}


- (NSArray *)savedArtists {
    return [self.archive copy];
}

- (void)saveArtist:(WASArtist *)artist {
    [self.archive addObject:artist];
    [self saveToPersistentStore];
}

- (void)removeArtist:(WASArtist *)artist {
    [self.archive removeObject:artist];
    [self saveToPersistentStore];
}

- (NSURL *)persistentFileURL {
    
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)saveToPersistentStore {
    NSError *saveError = nil;
    NSURL *url = [self persistentFileURL];
    NSMutableArray *artistsArray = [[NSMutableArray alloc] init];
    
    for (WASArtist *artist in self.archive) {
        NSDictionary *artistDict = [artist aDictionary];
        [artistsArray addObject:artistDict];
    }
    NSDictionary *artistsDictionary = @{
        @"artists" : artistsArray
    };
    bool successfulSave = [artistsDictionary writeToURL:url error:nil];
    if (successfulSave) {
        return;
    } else {
        NSLog(@"Error saving artists: %@", saveError);
    }
}

- (void)loadFromPersistentStore {
    NSURL *url = [self persistentFileURL];
    
    NSDictionary *artistsDictionary = [NSDictionary dictionaryWithContentsOfURL:url];
    
    if (![artistsDictionary[@"artists"]  isEqual: @""]) {
        NSArray *artistDictionaries = artistsDictionary[@"artists"];
        for (NSDictionary *artistDictionary in artistDictionaries) {
            WASArtist *artist = [[WASArtist alloc] initWithDictionary:artistDictionary];
            [self.archive addObject:artist];
        }
    }
}


static NSString * const baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (void)searchForArtistWithName:(NSString *)name completion:(void (^)(WASArtist *artist, NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:name];
    [components setQueryItems:@[searchItem]];
    NSURL *url = [components URL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a Dictionary as expected");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        if (dictionary[@"artists"] != [NSNull null]) {
            NSArray *artistDictionaries = dictionary[@"artists"];
            NSDictionary *artistDictionary = artistDictionaries.firstObject;
            WASArtist *artist = [[WASArtist alloc] initWithDictionary:artistDictionary];
            
            completion(artist, nil);
        }
    }] resume];
}

@end
