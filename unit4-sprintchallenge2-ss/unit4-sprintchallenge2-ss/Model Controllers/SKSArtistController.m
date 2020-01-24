//
//  SKSArtistController.m
//  unit4-sprintchallenge2-ss
//
//  Created by Lambda_School_Loaner_204 on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "SKSArtistController.h"
#import "SKSArtist+NSJSONSerialization.h"

@interface SKSArtistController()

@property (nonatomic) NSDictionary *artistDictionary;

- (void)loadArtistDictionary;
- (NSURL *)artistsFileURL;

@end

@implementation SKSArtistController

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
        SKSArtist *artist = [[SKSArtist alloc] initWithDictionary:artists];
        [artistArray addObject:artist];
    }
    return [artistArray copy];
}



- (void)writeDictionaryToFile:(NSDictionary *)dictionary {

    NSURL *fileURL = [self artistsFileURL];
    NSLog(@"FileURL %@", fileURL);
    NSError *writeToURLError = nil;

    [self.artistDictionary[@"artists"] addObject:dictionary];

    NSLog(@"Dictionary %@", self.artistDictionary);

    if([self.artistDictionary writeToURL:fileURL error:&writeToURLError]) {

    }
}

- (void)loadArtistDictionary {
    NSDictionary *artistDictionary = [NSDictionary dictionaryWithContentsOfURL:[self artistsFileURL] error: NULL];
    NSArray *artistDictionaries = artistDictionary[@"artists"];
    for (NSDictionary *artists in artistDictionaries) {
        [self.artistDictionary[@"artists"] addObject:artists];
    }
}

- (NSURL *)artistsFileURL {
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)searchForArtistsByName:(NSString *)name completion:(void (^)(SKSArtist *artist, NSError *error))completion {

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

        // Only one element in the array, so return the first!
        SKSArtist *artist = [[SKSArtist alloc] initWithDictionary:artistsDictionaries[0]];


        // for multiple artists if they exist!
//        for (NSDictionary *artistDictionary in artistsDictionaries) {
//            SKSArtist *artist = [[SKSArtist alloc] initWithDictionary:artistDictionary];
//            [self.tempArtists addObject:artist];
//        }
        completion(artist, nil);

    }] resume];

}

@end
