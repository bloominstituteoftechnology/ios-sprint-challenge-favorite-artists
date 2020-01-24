//
//  NMKArtistController.m
//  Favorite Artist ObjC
//
//  Created by Niranjan Kumar on 1/24/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKArtistController.h"
#import "NMKArtist.h"
#import "NSJSONSerialization+NMKArtist.h"

@interface NMKArtistController()

@property (nonatomic) NSMutableArray<NMKArtist *> *internalArtists;

@end

@implementation NMKArtistController

static NSString *const baseURLString = @"https://theaudiodb.com/api/v1/json/";
static NSString *const apiKey = @"1";

- (instancetype)init {
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchArtist:(NSString *)searchTerm completion:(void (^)(NMKArtist *, NSError *))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *fullURL = [[baseURL URLByAppendingPathComponent:apiKey] URLByAppendingPathComponent:@"search.php"];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:fullURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"s" value:searchTerm];
    [components setQueryItems:@[searchItem]];
    
    NSURL *searchURL = [components URL];
    NSLog(@"URL: %@", searchURL);
    NSURLRequest *request = [NSURLRequest requestWithURL:searchURL];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Data was nil");
            completion(nil, nil);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil, error);
            return;
        }
        
        NSArray *artists = json[@"artists"];
        
        if (artists && ![artists isKindOfClass:[NSNull class]]) {
            if ([artists count] > 0) {
                NSDictionary *dictionary = artists[0];
                if (dictionary) {
                    NMKArtist *artist = [[NMKArtist alloc] initWithDictionary:dictionary];
                    if (artist) {
                        completion(nil, error);
                        return;
                    } else {
                        NSLog(@"Could not create artist from dictionary.");
                        completion(nil, nil);
                        return;
                    }
                }
            }
        }
        
        NSLog(@"Could not parse returned dictionary.");
        completion(nil, nil);
    }];
    
    [task resume];
}





@end
