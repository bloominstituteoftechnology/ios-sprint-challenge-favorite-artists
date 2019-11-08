//
//  LSIArtistController.m
//  FavoriteArtist
//
//  Created by Lambda_School_Loaner_214 on 11/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistController ()
@property (nonatomic) NSMutableArray *internalArtists;
@end

@implementation LSIArtistController

static NSString *const baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)artists {
    return [self.internalArtists copy];
}

-(void)saveArtist:(LSIArtist *)artist{
    [self.internalArtists addObject:artist];
}

-(void)searchForArtist:(NSString *)name completion:(void (^)(LSIArtist *__nullable artist, NSError *__nullable error))completion{
    NSURL *url = [[NSURL alloc] initWithString:baseURLString];
    NSURLQueryItem *query = [[NSURLQueryItem alloc] initWithName:@"s" value:name];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:YES];
    [components setQueryItems:@[query]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[components URL]];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil,error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil,jsonError);
            return;
        }
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected");
            completion(nil,[[NSError alloc] init]);
            return;
        }
        
        LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:json];
        completion(artist, nil);
    }];
    [dataTask resume];
}
@end
