//
//  ArtistController.m
//  FavArtist
//
//  Created by Norlan Tibanear on 1/27/21.
//


#import "ArtistController.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

@interface ArtistController() {}

@property (nonatomic) NSMutableArray *saveArtistsItems;

@end




@implementation ArtistController

- (instancetype)init {
    self = [super init];
    if (self) {
        _saveArtistsItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)saveArtists {
    return [self.saveArtistsItems copy];
}

- (void)addArtist:(Artist *)artist {
    [self.saveArtistsItems addObject:artist];
    [self saveToPersistentStore];
}


static NSString *const searchBaseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";

   // Persistence
- (NSURL *)persistURL {
    
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    NSString *path = @"artists.json";
    return [url URLByAppendingPathComponent:path];
}//


- (void)saveToPersistentStore {
    NSError *error = nil;
    NSURL *url = [self persistURL];
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (Artist *artist in self.saveArtists) {
        NSDictionary *artistDict = [artist toDictionary];
        [artists addObject:artistDict];
    }
    NSDictionary *dict = @{@"artists" : artists};
    
    bool success = [dict writeToURL:url error:nil];
    if (success) {
        NSLog(@"save");
        return;
    } else {
        NSLog(@"Error saving artists: %@", error);
    }
}


- (void)loadFromPersistentStore {
    NSURL *url = [self persistURL];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfURL:url];
    
    if (![dict[@"artists"]  isEqual: @""]) {
        NSArray *artistDictionaries = dict[@"artists"];
        
        for (NSDictionary *dict in artistDictionaries) {
            Artist *artist = [[Artist alloc] initWithDictionary:dict];
            [self.saveArtistsItems addObject:artist];
        }
    }
}

- (void)searchArtist:(NSString *)name completion:(NTSearchArtist)completion {

//- (void)artistSearch:(NSString *)name completion:(void (^)(Artist *artist, NSError *error))completion {
   
    NSURL *baseURL = [NSURL URLWithString:searchBaseURL];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:name];
    [components setQueryItems:@[searchItem]];
    
    NSURL *url = [components URL];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error getting Artist: %@", error);
            completion(nil, error);
            return;
        }// error
        
        // json
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSLog(@"JSON Dictionary: %@", dictionary);
        if (jsonError) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            completion(nil, jsonError);
            return;
        }// json
        
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a Dictionary as expected");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        if (dictionary[@"artists"] != [NSNull null]) {
            NSArray *artistDictionaries = dictionary[@"artists"];
            NSDictionary *artistDictionary = artistDictionaries.firstObject;
            
            Artist *artist = [[Artist alloc] initWithDictionary:artistDictionary];
            completion(artist, nil);
        }
        
    }] resume];
    
}//



@end
