//
//  LYDArtistController.m
//  LYDFavoriateArtist
//
//  Created by Lydia Zhang on 5/15/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

#import "LYDArtistController.h"
#import "LYDArtist.h"
#import "LYDArtist+LYDJSONHelper.h"

@interface LYDArtistController() {}

@property (nonatomic) NSMutableArray* artistsArrayMutable;

@end

static NSString * const baseURLStr = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation LYDArtistController

- (NSURL *)fileURL {
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
}

- (void)saveArtistToStore {
    NSError *savingError = nil;
    NSURL *url = [self fileURL];
    NSMutableArray *artistArray = [[NSMutableArray alloc]init];
    
    for (LYDArtist *artist in self.artistsArrayMutable) {
        NSDictionary *dic = [artist toDictionary];
        [artistArray addObject: dic];
    }
    NSDictionary *artistsDictionary = @{
        @"artists" : artistArray
    };
    bool saveSuccess = [artistsDictionary writeToURL:url error:nil];
    if (saveSuccess) {
        NSLog(@"save successed");
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
            LYDArtist *artist = [[LYDArtist alloc] initWithDictionary:artistDictionary];
            [self.artistsArrayMutable addObject:artist];
        }
    }
    NSLog(@"Loaded");
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

- (void)saveArtist:(LYDArtist *)artist{
    [self.artistsArrayMutable addObject:artist];
    [self saveArtistToStore];
}

- (void)deleteArtist:(LYDArtist *)artist{
    [self.artistsArrayMutable removeObject:artist];
    [self saveArtistToStore];
}

-(void)findArtistWithName:(NSString *)name completion:(void (^)(LYDArtist *artist, NSError *error))completion{
    
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
            NSLog(@"Json error");
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
            LYDArtist *artist = [[LYDArtist alloc] initWithDictionary:artistDictionary];

            completion(artist, nil);
        }
    }] resume];
}
@end

