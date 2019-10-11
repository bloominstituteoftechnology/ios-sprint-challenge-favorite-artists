//
//  BYArtistController.m
//  Artist-objc
//
//  Created by Bradley Yin on 10/11/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

#import "BYArtistController.h"
#import "BYArtist.h"
#import "BYArtist+BYNSJSONSerialization.h"

@implementation BYArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _artists = [[NSMutableArray alloc] initWithArray:@[]];
        //[self loadArtists];
    }
    return self;
}

- (void)addArtist:(BYArtist *)artist {
    [self.artists addObject: artist];
    [self saveArtists];
}

- (void)saveArtists {
    NSMutableArray *savingArray = [[NSMutableArray alloc] init];
    for (BYArtist *artist in _artists) {
        NSDictionary *dictionary = [artist toDictionary];
        [savingArray addObject:dictionary];
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Artists.plist"];
    NSArray *savingArrayNoMutable = [NSArray arrayWithArray:savingArray];
    bool sucess = [savingArrayNoMutable writeToFile:path atomically:YES];
}


- (void)loadArtists {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Artists.plist"];
    NSArray *artistsArray = [[NSArray alloc] initWithContentsOfFile:path];
    for(NSDictionary *dictionary in artistsArray) {
        BYArtist *artist = [[BYArtist alloc] initWithFileDictionary:dictionary];
        [self.artists addObject:artist];
    }
}
@end
