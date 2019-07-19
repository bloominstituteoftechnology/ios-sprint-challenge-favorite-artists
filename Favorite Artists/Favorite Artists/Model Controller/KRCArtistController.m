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

- (NSArray *)artistnCollection {
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
        NSLog(@"Yes");
    }
    
//    NSMutableArray *jsonCOntainer = [[NSMutableArray alloc] init];
//
//    for(int i = 0; i < [[self internalPokemonCollection] count]; i++) {
//
//        NSNumber *experience = [NSNumber numberWithInteger:[[[self internalPokemonCollection] objectAtIndex:i] pokemonExperience]];
//
//        NSDictionary *data = @{@"name": [[[self internalPokemonCollection] objectAtIndex:i] pokemonName],
//                               @"abilities": [[[self internalPokemonCollection] objectAtIndex:i] pokemonAbilities],
//                               @"experience": experience,
//                               @"url": [[[self internalPokemonCollection] objectAtIndex:i] pokemonImageURL]
//                               };
//
//        [jsonCOntainer addObject:data];
//    }
//
//    NSDictionary *jsonDict = @{@"data" : jsonCOntainer};
//
//    if ([NSJSONSerialization isValidJSONObject:jsonDict])
//    {
//        // Serialize the dictionary
//        NSError *error = nil;
//        NSData *json = [NSJSONSerialization dataWithJSONObject:jsonDict options:NSJSONWritingPrettyPrinted error:&error];
//
//        // If no errors, let's view the JSON
//        if (json != nil && error == nil)
//        {
//            // Build the path, and create if needed.
//            NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//            NSString* fileName = @"pokemon.json";
//            NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
//
//            if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
//                [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
//            }
//
//            // The main act...
//            [json writeToFile:fileAtPath atomically:NO];
//        }
//    }
}

- (void)loadFile {
    
//    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString* fileName = @"pokemon.json";
//    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
//    
//    // The main act...
//    NSString *json = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@\n\n\n\n%@", fileAtPath, json);
    
}

- (NSString *)getFileName {
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [path objectAtIndex:0];
    NSString *filePath = [documentFolder stringByAppendingFormat:@"/pokemon.plist"];
    
    return filePath;
}

@end
