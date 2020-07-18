//
//  CAMArtistController.m
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import "CAMArtistController.h"
#import "CAMArtist.h"
#import "CAMArtist+Serialization.h"

@interface CAMArtistController () {}

@property (nonatomic) NSMutableArray *favoriteArtistsSafeStore;

@end

@implementation CAMArtistController
//MARK: - Internal Properties & Get Methods-
static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (NSArray *)savedArtists
{
    return [self.favoriteArtistsSafeStore copy];
}



//MARK: - Inits -
- (instancetype)init
{
    self = [super init];
    if (self) {
        _favoriteArtistsSafeStore = [[NSMutableArray alloc] init];
    }
    return self;
}



//MARK: - Actions -
- (void)loadArtists
{
    NSURL *url = [self favoritesURL];
    NSDictionary *favoriteArtists = [NSDictionary dictionaryWithContentsOfURL: url];
    if (![favoriteArtists[@"artists"] isEqual: @""]) {
        NSArray *artists = favoriteArtists[@"artists"];
        for (NSDictionary *dictionary in artists) {
            CAMArtist *artist = [[CAMArtist alloc]loadFromDictionary: dictionary];
            [self.favoriteArtistsSafeStore addObject: artist];
        }
    }
}

- (void)saveArtist:(CAMArtist *)artist
{
    [self.favoriteArtistsSafeStore addObject: artist];
    [self saveArtists];
}

- (void)deleteArtist:(CAMArtist *)artist
{
    [self.favoriteArtistsSafeStore removeObject:artist];
    [self saveArtists];
}

-(void)searchForName:(NSString *)name
          completion:(nonnull artistCompletion)completion
{
    NSURL *baseURL = [NSURL URLWithString: baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL: baseURL
                                             resolvingAgainstBaseURL: YES];
    NSURLQueryItem *searchTerm = [NSURLQueryItem queryItemWithName: @"s"
                                                             value: name];
    [components setQueryItems: @[searchTerm]];
    NSURL *searchURL = [components URL];
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL: searchURL completionHandler:^(NSData * _Nullable data,
                                                                                  NSURLResponse * _Nullable response,
                                                                                  NSError * _Nullable error)
      {
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *dataError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData: data
                                                             options: 0
                                                               error: &dataError];
        if (dataError) {
            completion(nil, dataError);
            return;
        }
        
        if (![json isKindOfClass: [NSDictionary class]]) {
            NSLog(@"Unexpected, bad, or missing data.");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        if (json[@"artists"] != [NSNull null]) {
            NSArray *artistsArray = json[@"artists"];
            NSDictionary *artistsDictionary = artistsArray.firstObject;
            CAMArtist *artist = [[CAMArtist alloc] initWithDictionary: artistsDictionary];
            
            completion(artist, nil);
        }
    }] resume];
}


//MARK: - Methods -
- (NSURL *)favoritesURL
{
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory: NSDocumentDirectory
                                                                       inDomains: NSUserDomainMask] firstObject];
    NSString *fileName = @"favoriteArtists.json";
    return [documentDirectory URLByAppendingPathComponent: fileName];
}

- (void)saveArtists
{
    NSURL *url = [self favoritesURL];
    NSError *error = nil;
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (CAMArtist *artist in self.favoriteArtistsSafeStore) {
        NSDictionary *artistData = [artist createDictionary];
        [artists addObject: artistData];
    }
    
    NSDictionary *artistsToSave =
    @{
        @"artists" : artists
    };
    
    bool success = [artistsToSave writeToURL:url error:nil];
    
    if (success) {
        return;
    } else {
        NSLog(@"Error saving favorite artists. Here's what happened: %@", error);
    }
    
}

@end
