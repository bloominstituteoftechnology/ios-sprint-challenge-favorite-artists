//
//  MSKArtistController.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/16/20.
//  Copyright © 2020 Lambda. All rights reserved.
//
#import "MSKArtistController.h"
#import "MSKArtist.h"
#import "MSKArtist+NSJSONSerialization.h"
static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php";
@implementation MSKArtistController
- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadArtistsFromPersistence:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"Problem loading from persistance!");
            }
        }];
    }
    return self;
}
- (void)fetchArtistWithName:(NSString *)artistName
            completionBlock:(void (^)(MSKArtist *artist,
                                      NSError * _Nullable error))completionBlock {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:[NSURL
                                                                         URLWithString:baseURL]
                                                resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"s"
                                    value:artistName]
    ];
    NSURL *url = [urlComponents URL];
    NSURLSessionDataTask *task = [NSURLSession.sharedSession
                                  dataTaskWithURL:url
                                  completionHandler:^(NSData * _Nullable data,
                                                      NSURLResponse * _Nullable response,
                                                      NSError * _Nullable error) {
        NSLog(@"%@",
              urlComponents.URL);
        if (error) {
            completionBlock(nil,
                            error);
            return;
        }
        [self parseJSONData:data
            completionBlock:^(MSKArtist * _Nullable artist,
                              NSError * _Nullable error) {
            if (error) {
                completionBlock(nil,
                                error);
                return;
            }
            completionBlock(artist,
                            nil);
        }];
    }];
[task resume];
}
- (void)parseJSONData:(NSData *)data
      completionBlock:(void (^)(MSKArtist * _Nullable artist,
                                NSError * _Nullable error))completionBlock {
    NSError *jsonError = nil;
    NSDictionary *dataDict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:&jsonError];
    if (jsonError) {
        NSLog(@"There was a jsonError!");
        completionBlock(nil, jsonError);
    }
    if ([dataDict[@"artists"]
         isKindOfClass:[NSNull class]]) {
        NSLog(@"Something is messed up at the pull");
        completionBlock(nil,
                        [[NSError alloc] initWithDomain:@"domain"
                                                   code:1
                                               userInfo:nil]);
        return;
    }
    MSKArtist *artist = [[MSKArtist alloc] initFromDict:dataDict[@"artists"][0]];
    completionBlock(artist, nil);
    return;
}
- (void)loadArtistsFromPersistence:(void (^)(NSError * _Nullable error))completionBlock {
    NSURL *documents = [[NSFileManager defaultManager]
                        URLsForDirectory:NSDocumentDirectory
                        inDomains:NSUserDomainMask].firstObject;
    self.artists = _artists.init;
    NSURL *persistentURL = [documents URLByAppendingPathComponent:@"artists.json"];
    NSDictionary *artistDict = [NSDictionary dictionaryWithContentsOfURL:persistentURL];
    NSArray *artistArray = artistDict[@"artists"];
    for (NSDictionary *dict in artistArray) {
        MSKArtist *artist = [[MSKArtist alloc] initFromDict:dict];
        [self.artists addObject:artist];
    }
}
- (void)saveArtistToPersistence:(MSKArtist *)artist completionBlock:(void (^)(NSError * _Nullable error))completionBlock;{
    NSURL *documents = [[NSFileManager defaultManager]
                        URLsForDirectory:NSDocumentDirectory
                        inDomains:NSUserDomainMask].firstObject;
    NSURL *persistentURL = [documents URLByAppendingPathComponent:@"artists.json"];
    NSDictionary *artistDict = [NSDictionary  dictionaryWithObject:artist forKey:artist.artistName];
    [artistDict writeToURL:persistentURL error:nil];
}
@end
