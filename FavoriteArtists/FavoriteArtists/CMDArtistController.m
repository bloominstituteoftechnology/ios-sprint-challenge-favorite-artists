//
//  CMDArtistController.m
//  FavoriteArtists
//
//  Created by Chris Dobek on 6/12/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import "CMDArtistController.h"
#import "CMDArtist.h"
#import "CMDArtist+JSONHelper.h"

@interface CMDArtistController() {}

@property (nonatomic) NSMutableArray* artistsArrayMutable;

@end

static NSString * const baseURLStr = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation CMDArtistController

- (NSURL *)fileURL {
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)saveArtistToStore {
    NSError *savingError = nil;
    NSURL *url = [self fileURL];
    NSMutableArray *artistArray = [[NSMutableArray alloc]init];
    
    for (CMDArtist *artist in self.artistsArrayMutable) {
        NSDictionary *dic = [artist toDictionary];
        [artistArray addObject: dic];
    }
    
    NSDictionary *artistsDictionary = @{
        @"artists" : artistArray
    };
    
    bool saveSuccess = [artistsDictionary writeToURL:url error:nil];
    if (saveSuccess) {
        NSLog(@"Save Successful!");
        return;
    } else {
        NSLog(@"Error saving artists: %@", savingError);
    }
}

- (void)loadArtistFromStore{
    NSURL *url = [self fileURL];

    NSDictionary *artistsDictionary = [NSDictionary dictionaryWithContentsOfURL:url];

    if (![artistsDictionary[@"artists"]  isEqual: @""]) {
        NSArray *artistDictionaries = artistsDictionary[@"artists"];
        for (NSDictionary *artistDictionary in artistDictionaries) {
            CMDArtist *artist = [[CMDArtist alloc] initWithDictionary:artistDictionary];
            [self.artistsArrayMutable addObject:artist];
        }
    }
    NSLog(@"Artist Loaded!");
}

- (instancetype)init{
    self = [super init];
    if (self){
        _artistsArrayMutable = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSArray *)artists {
    return [self.artistsArrayMutable copy];
}

- (void)saveArtist:(CMDArtist *)artist{
    [self.artistsArrayMutable addObject:artist];
    [self saveArtistToStore];
}

- (void)deleteArtist:(CMDArtist *)artist{
    [self.artistsArrayMutable removeObject:artist];
    [self saveArtistToStore];
}

-(void)findArtistWithName:(NSString *)name completion:(void (^)(CMDArtist *artist, NSError *error))completion{
    
    NSURLComponents *component = [[NSURLComponents alloc] initWithString:baseURLStr];
    
    component.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    NSURL *url = component.URL;
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {

        if (error) {
            NSLog(@"Error requesting artist");
            completion(nil, error);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) {
            NSLog(@"JSON error");
            completion(nil, jsonError);
            return;
        }

        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a Dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }

        if (dictionary[@"artists"] != [NSNull null]) {
            NSArray *artistDictionaries = dictionary[@"artists"];
            NSDictionary *artistDictionary = artistDictionaries.firstObject;
            CMDArtist *artist = [[CMDArtist alloc] initWithDictionary:artistDictionary];

            completion(artist, nil);
        }
    }] resume];
}

@end
