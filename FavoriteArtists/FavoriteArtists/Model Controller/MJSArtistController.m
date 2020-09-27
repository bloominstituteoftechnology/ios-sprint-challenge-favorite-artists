//
//  MJSArtistController.m
//  FavoriteArtists
//
//  Created by Morgan Smith on 9/27/20.
//

#import "MJSArtistController.h"
#import "MJSArtist.h"

static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@implementation MJSArtistController

- (void)fetchArtistsWithName:(NSString *)name completion:(ArtistFetchCompletionHandler)completion {

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURL];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];

    NSURL *url = urlComponents.URL;

    if (!url) {
        return;
    }

    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }

        if (!data) {
            NSError *dataError = error;
            completion(nil, dataError);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) {
            completion(nil, jsonError);
            return;
        }

        if ([dictionary[@"artists"] isKindOfClass:[NSNull class]]) {
            completion(nil, [[NSError alloc] init]);
            return;
        }

        NSDictionary *artist = [[dictionary objectForKey:@"artists"] firstObject];
        if (artist == nil) {
            completion(nil, [[NSError alloc] init]);
        }

        MJSArtist *artistResults = [[MJSArtist alloc] initWithDictionary:artist];
        completion(artistResults, nil);
    }];

    [task resume];
}

- (NSArray *)fetchSavedArtists {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [path objectAtIndex:0];
    NSArray *filePath = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];

    NSMutableArray *artists = [[NSMutableArray alloc] init];

    for (NSString *artist in filePath) {
        NSString *artistForPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", artist];
        NSURL *artistURL = [NSURL fileURLWithPath:artistForPath];

        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
        NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];

        MJSArtist *artist = [[MJSArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }

    return artists;
}

@end
