//
//  SAEArtistController.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 2/15/21.
//

#import "SAEArtist.h"
#import "SAEArtistController.h"
#import "SAEArtist+NSJSONSerialization.h"

@interface SAEArtistController() {}
@property (nonatomic) NSMutableArray *saveArtistsItems;
@end

@implementation SAEArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _saveArtistsItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)saveArtists {
    return [self.saveArtistsItems copy];
}

- (void)addArtists:(SAEArtist*)artist {
    [self.saveArtistsItems addObject:artist];
    [self saveToPresistentStore];
}

static NSString *const searchBaseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?";

- (NSURL *)persistURL {
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    NSString *path = @"artists.json";
    return [url URLByAppendingPathComponent:path];
}

-(void)saveToPresistentStore {
    NSError *error = nil;
    NSURL *url = [self persistURL];
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (SAEArtist *artist in self.saveArtists) {
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
            SAEArtist *artist = [[SAEArtist alloc] initWithDictionary:dict];
            [self.saveArtistsItems addObject:artist];
        }
    }
}

- (void)searchArtist:(NSString *)searchTerm completionHandler:(SAEArtistControllerCompletionHandler)completionHandler
{
    NSURL *baseURL = [NSURL URLWithString:searchBaseURL];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:searchTerm];
    [components setQueryItems:@[searchItem]];
    
    NSURL *url = [components URL];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error getting Artist: %@", error);
            completionHandler(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSLog(@"JSON Dictionary: %@", dictionary);
        if (jsonError) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            completionHandler(nil, jsonError);
            return;
        }
        
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a Dictionary as expected");
            completionHandler(nil, [[NSError alloc] init]);
            return;
        }
        
        if (dictionary[@"artists"] != [NSNull null]) {
            NSArray *artistDictionaries = dictionary[@"artists"];
            NSDictionary *artistDictionary = artistDictionaries.firstObject;
            
            SAEArtist *artist = [[SAEArtist alloc] initWithDictionary:artistDictionary];
            completionHandler(artist, nil);
        }
        
    }] resume];
}

@end
