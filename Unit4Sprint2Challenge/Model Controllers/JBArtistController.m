//
//  JBArtistController.m
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import "JBArtistController.h"
#import "JBArtist+NSJSONSerialization.h"


static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";
static NSString *artistsKey = @"artists";

@interface JBArtistController ()

@property (nonatomic) NSMutableArray *mutableArtists;

@end


@implementation JBArtistController

- (NSArray *)artists
{
    return [self.mutableArtists copy];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mutableArtists = [@[] mutableCopy];
        // TODO: - Load artists from file if they exist
    }
    return self;
}

#pragma mark - Public API

- (void)addArtist:(JBArtist *)artist
{
    [self.mutableArtists addObject:artist];
}

- (void)fetchArtistWithName:(NSString *)name
                 completion:(void (^)(JBArtist *artist, NSError *error))completion
{
    NSURLComponents *components = [NSURLComponents componentsWithString:baseURLString];
    components.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    [[NSURLSession.sharedSession dataTaskWithURL:components.URL
                               completionHandler:^(NSData * _Nullable data,
                                                   NSURLResponse * _Nullable response,
                                                   NSError * _Nullable error)
    {
        if (error)
        {
            completion(nil, error);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&jsonError];
        if (jsonError)
        {
            completion(nil, error);
            return;
        }
        NSArray *artists = dictionary[artistsKey];
        if (artists.count > 0)
        {
            NSDictionary *artistDict = artists.firstObject;
            JBArtist *artist = [[JBArtist alloc] initWithDictionary:artistDict];
            completion(artist, nil);
        }
        else
        {
            completion(nil, nil);
        }
    }] resume];
}

@end
