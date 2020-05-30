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
- (void)fetchArtistWithName:(NSString *)artistName completionBlock:(void (^)(SBAArtist * _Nullable, NSError * _Nullable))completionBlock
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

//TO DO setup persistence

@end
