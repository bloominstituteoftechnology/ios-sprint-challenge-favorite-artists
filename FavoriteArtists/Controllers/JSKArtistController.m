//
//  JSKArtistController.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKArtistController.h"
#import "JSKArtist.h"
#import "JSKArtist+NSJSONSerialization.h"

@interface JSKArtistController()

@property(nonatomic) NSMutableArray *internalArtist;

@end

@implementation JSKArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtist = [[self loadArtist] mutableCopy];
    }
    return self;
}

- (void)addArtist:(JSKArtist *)artist {

    [self.internalArtist addObject:artist];
    [self saveArtist];
}

- (NSArray *)artists {
    return self.internalArtist;
}

- (NSURL *)getArtistURL {

    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];

    NSString *artistFile = @"artists.json";

    return [documentsDirectoryURL URLByAppendingPathComponent:artistFile];

}

- (NSArray *)loadArtist {

    NSData *artistData = [NSData dataWithContentsOfURL: [self getArtistURL] ];

    if(!artistData) {
        return @[];
    }

    NSError *jsonError = nil;
    NSArray *savedArtistsArray = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:&jsonError];
    if(jsonError) {
        NSLog(@"failed to fetch movies from documents directory: %@", jsonError);
        return @[];
    }

    NSMutableArray *artists = [[NSMutableArray alloc] init];
    for(int i = 0; i < savedArtistsArray.count; i++) {
        NSDictionary *artistDictionary = savedArtistsArray[i];
        JSKArtist *artist = [[JSKArtist alloc] initWithDictionary:artistDictionary];
        [artists addObject:artist];
    }

    return artists;
}

- (void)saveArtist {

    NSMutableArray *artistDictionary = [[NSMutableArray alloc] init];

    for(int i = 0; i < self.internalArtist.count; i++) {
        JSKArtist *artist = self.internalArtist[i];
        [artistDictionary addObject: [artist toDictionary]];
    }

    NSData *artistData = [NSJSONSerialization dataWithJSONObject:artistDictionary options:0 error:nil];

    [artistData writeToURL:[self getArtistURL] atomically:YES];

}

@end
