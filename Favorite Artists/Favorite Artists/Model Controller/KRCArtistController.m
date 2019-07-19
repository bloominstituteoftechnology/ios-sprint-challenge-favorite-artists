//
//  KRCArtistController.m
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import "KRCArtistController.h"
#import "KRCArtist.h"
#import "NSJSONSerialization+KRCArtistCreation.h"

@interface KRCArtistController ()

@property NSMutableArray *internalArtistCollection;
@property NSString *baseURL;

@end

@implementation KRCArtistController

//@synthesize artistCollection = _artistCollection;

- (instancetype)init {
    
    if (self = [super init]) {
        _internalArtistCollection = [[NSMutableArray alloc] init];
        
        _baseURL = @"https://theaudiodb.com/api/v1/json/1/search.php";
    }
    
    return self;
}

- (NSArray *)artistCollection {
    return [[self internalArtistCollection] copy];
}

- (void)addArtist:(KRCArtist *)artist {
    [[self internalArtistCollection] addObject:artist];
}

- (void)deleteArtist:(KRCArtist *)artist {
    [[self internalArtistCollection] removeObject:artist];
}

- (void)fetchArtistNamed:(NSString *)name completion:(KRCCompletion)completion {
    
    NSURLComponents *components = [NSURLComponents componentsWithString:[self baseURL]];
    NSArray *query = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    [components setQueryItems:query];
    
    NSURL *url = [components URL];
    
    NSLog(@"%@", [url absoluteString]);
    
    NSURLSessionTask *fetchArtistTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data,
                                                                                                               NSURLResponse * _Nullable response,
                                                                                                               NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        
        
        KRCArtist *artist = [NSJSONSerialization ArtistFromJson:jsonDictionary];
        
        
        if (artist) {
            completion(artist, nil);
            return;
        } else {
            completion(nil, [[NSError alloc] initWithDomain:NSURLErrorDomain code:1 userInfo:nil]);
        }
        
    }];
    
    [fetchArtistTask resume];
}

- (void)saveToFIle {
    
    NSDictionary *jsonDict = [NSJSONSerialization JsonFromArtists:[self internalArtistCollection]];
    
    if ([NSJSONSerialization isValidJSONObject:jsonDict]) {
        
        NSError *error = nil;
        NSData *json = [NSJSONSerialization dataWithJSONObject:jsonDict options:NSJSONWritingPrettyPrinted error:&error];
        
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString* fileName = @"artists.json";
        NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
            [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
        }
        
        [json writeToFile:fileAtPath atomically:NO];
        
        NSLog(@"%@", fileAtPath);
    }
}

- (void)loadFile {
    
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"artists.json";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:fileAtPath] options:0 error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return;
    }
    
    NSArray *allArtists = [json objectForKey:@"artists"];
    
    for(int i = 0; i < [allArtists count]; i++) {
        NSDictionary *artistDictionary = [allArtists objectAtIndex:i];
        
        NSString *name = [artistDictionary objectForKey:@"strArtist"];
        NSString *bio = [artistDictionary objectForKey:@"strBiographyEN"];
        NSString *year = [artistDictionary objectForKey:@"intFormedYear"];
        
        KRCArtist *artist = [[KRCArtist alloc] initWithName:name year:[year integerValue] bio:bio];
        
        [[self internalArtistCollection] addObject:artist];
    }
    
}

@end
