//
//  IGFArtistController.m
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//

#import "IGFArtistController.h"
#import "IGFArtist+NSJONSerialization.h"


@interface IGFArtistController()

@property (nonatomic) NSDictionary *artistDictionary;

- (void)loadArtistDictionary;
- (NSURL *)artistsURL;

@end


@implementation IGFArtistController

static NSString * const baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _artistDictionary = @{
            @"artists" : [[NSMutableArray alloc] init]
        };
        [self loadArtistDictionary];
    }
    return self;
}

- (NSArray *)artists {
    NSMutableArray *artistArray = [[NSMutableArray alloc] init];

    NSArray *artistDictionaries = self.artistDictionary[@"artists"];

    for (NSDictionary *artists in artistDictionaries) {
        IGFArtist *artist = [[IGFArtist alloc] initWithDictionary:artists];
        [artistArray addObject:artist];
    }
    return [artistArray copy];
}

- (void)writeDictionaryToFile:(NSDictionary *)dictionary {

    NSURL *fileURL = [self artistsURL];
    NSLog(@"FileURL %@", fileURL);
    NSError *writeToURLError = nil;

    [self.artistDictionary[@"artists"] addObject:dictionary];

    NSLog(@"Dictionary %@", self.artistDictionary);

    if([self.artistDictionary writeToURL:fileURL error:&writeToURLError]) {

    }
}

- (void)loadArtistDictionary {
    NSDictionary *artistDictionary = [NSDictionary dictionaryWithContentsOfURL:[self artistsURL] error: NULL];
    NSArray *artistDictionaries = artistDictionary[@"artists"];
    for (NSDictionary *artists in artistDictionaries) {
        [self.artistDictionary[@"artists"] addObject:artists];
    }
}

- (NSURL *)artistsURL {
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}


- (void)searchForArtistByName:(NSString *)name completion:(void (^)(IGFArtist *artist, NSError *error))completion {

    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];

    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:name];
    [components setQueryItems:@[searchItem]];

    NSURL *url = components.URL;

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
            NSError *dictionaryError = [[NSError alloc] init];
            completion(nil, dictionaryError);
        }

        NSArray *artistsDictionaries = dictionary[@"artists"];



        IGFArtist *artist = [[IGFArtist alloc] initWithDictionary:artistsDictionaries[0]];

        completion(artist, nil);

    }] resume];

}

@end

