//
//  GIPArtistController.m
//  Favorite-Artists
//
//  Created by Gi Pyo Kim on 12/13/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

#import "GIPArtistController.h"
#import "GIPArtist+NSJSONSerialization.h"
#import "GIPArtist.h"

@interface GIPArtistController()

- (void)save;

@end

@implementation GIPArtistController

static NSString *const baseURLString = @"https://theaudiodb.com/api/v1/json";
static NSString *const testApiKey = @"1";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _artists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchArtistWithName:(NSString *)name completion:(void (^)(GIPArtist *artist, NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    [baseURL URLByAppendingPathComponent:testApiKey];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchName = [NSURLQueryItem queryItemWithName:@"search.php?s" value:name];
    [components setQueryItems:@[searchName]];
     
    NSURL *url = [components URL];
    NSLog(@"URL: %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data returned nil");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if(jsonError) {
            completion(nil, error);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a top level dictionary as expected");
            completion(nil, [[NSError alloc] init]);
            return;
        }

        NSArray *results = json[@"artists"];
        NSDictionary *result = results[0];
                
        GIPArtist *artist = [[GIPArtist alloc] initWithDictionary:result];
        
        completion(artist, nil);

    }];
    [task resume];
     
}

- (void)addArtist:(GIPArtist *)artist {
    [self.artists addObject:[artist toDictionary]];
    [self save];
}

- (void)removeArtist:(GIPArtist *)artist {
    [self.artists removeObject:[artist toDictionary]];
    [self save];
}

- (void)save {
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [searchPaths objectAtIndex:0];
    NSURL *url = [NSURL URLWithString:documentPath];
    
    [self.artists writeToURL:url atomically:YES];
}

@end
