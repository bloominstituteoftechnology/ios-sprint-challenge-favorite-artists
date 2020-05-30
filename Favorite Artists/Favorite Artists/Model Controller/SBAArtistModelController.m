//
//  SBAArtistModelController.m
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import "SBAArtistModelController.h"
#import "SBAArtist.h"
#import "SBAArtist+NSJSONSerialization.h"

//BaseURL for search string
static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";


@implementation SBAArtistModelController

- (instancetype)init {
  self = [super init];
  if (self) {
    _favoriteArtists = [[NSMutableArray<SBAArtist *> alloc] init];
  }
  return self;
}
//Fetch artists from search
- (void)fetchArtistWithName:(NSString *)artistName  completionBlock:(void (^)(SBAArtist * _Nullable artist, NSError * _Nullable error))completionBlock
{
  NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
  
  urlComponents.queryItems = @[
    [NSURLQueryItem queryItemWithName:@"s" value:artistName]
  ];
  NSURL *url = urlComponents.URL;
  
  // Session Data Task
  NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSLog(@"%@", urlComponents.URL);
    if (error) {
      completionBlock(nil, error);
      return;
    }
    
    //Parse JSON
    [self parseJSONData:data completionBlock:^(SBAArtist * _Nullable artist, NSError * _Nullable error) {
            if (error) {
                completionBlock(nil, error);
                return;
            }
            completionBlock(artist, nil);
        }];
    }];
    [task resume];
}

//parse JSON Data Method
- (void)parseJSONData:(NSData *)data
      completionBlock:(void (^)(SBAArtist * _Nullable artist, NSError * _Nullable error))completionBlock {

    NSError *jsonError = nil;

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

    if (jsonError) {
        completionBlock(nil, jsonError);
        return;
    }

    if ([json[@"artists"] isKindOfClass:[NSNull class]]) {
        completionBlock(nil, [[NSError alloc] initWithDomain:@"domain" code:1 userInfo:nil]);
        return;
    }

    SBAArtist *newArtist = [[SBAArtist alloc] initFromDictionary:json];
    completionBlock(newArtist, nil);

    return;
}

//TO DO setup persistence

- (void)loadFromPersistence:(void (^)(NSError * _Nullable))completionBlock
{
  NSURL *documentsDirectory = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
  NSError *loadDataError = nil;
  NSArray *data = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&loadDataError];
  if (loadDataError) {
    completionBlock(loadDataError);
    return;
  }
  
  for (NSString *path in data) {
    NSURL *filePath = [documentsDirectory URLByAppendingPathComponent:path];
    NSDictionary *fileDictionary = [NSDictionary dictionaryWithContentsOfURL:filePath];
    SBAArtist *newArtist = [[SBAArtist alloc] initFromDictionary:fileDictionary];
    [self.favoriteArtists addObject:newArtist];
  }
  completionBlock(nil);
}


@end
