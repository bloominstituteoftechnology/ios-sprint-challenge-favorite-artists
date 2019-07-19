//
//  DLJArtistController.m
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import "DLJArtistController.h"
#import "DLJArtist.h"
#import "DLJJSONSerialization.h"

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?=";


@interface DLJArtistController()
@property (nonatomic) NSMutableArray *internalArtists;

@end

@implementation DLJArtistController

-(instancetype)init {
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];

    }

    return self;
}

- (void)saveArtist:(DLJArtist *)artist {
    [self.internalArtists addObject:artist];
}


-(NSMutableArray *)artistArray {
    NSArray *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [searchPath objectAtIndex:0];
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];

    for (NSString *artist in filePaths) {
        NSString *filePath = [[NSString alloc]initWithFormat:@"Documents/%@", artist];
        NSString *artistPath = [NSHomeDirectory()stringByAppendingPathComponent:filePath];

        NSURL *artistURL = [NSURL fileURLWithPath:artistPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];

        if (artistData != nil) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            DLJArtist *artist = [[DLJArtist alloc] initWithDictionary:artistDictionary];
            [self.internalArtists addObject:artist];
        } else {
            NSLog(@"Artist Data returned nil");
        }
    }
    return self.internalArtists;
}



- (void)fetchArtistsWithName:(NSString *)name completion:(DLJCompletionBlock)completion {

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];

    // Query Items
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"s" value:name]
                            ];

    urlComponents.queryItems = queryItems;
    NSURL *url = urlComponents.URL;

    // create URLRequest

   // NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlComponents.URL];

    //URLSession dataTask

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist from dataTask: %@", error);
            completion(nil, error);
            return;
        }

        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError){
            NSLog(@"Error wit jsonSerialization %@", jsonError);
            completion(nil, jsonError);
            return;
        }

       NSArray *jsonDict = json[@"artists"];
        DLJArtist *artist = [[DLJArtist alloc] initWithDictionary: jsonDict[0]];
        completion(artist, nil);

    }];

    [dataTask resume];
}

-(DLJArtist *)getSavedArtist:(DLJArtist *)artist {

    NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[documentDirectory URLByAppendingPathComponent:artist.name] URLByAppendingPathExtension:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];

    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    DLJArtist *savedArtist = [[DLJArtist alloc] initWithDictionary:dictionary];
    return savedArtist;
}





@end
