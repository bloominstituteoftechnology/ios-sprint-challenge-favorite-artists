//
//  DSCArtistController.m
//  FavoriteArtists
//
//  Created by denis cedeno on 5/31/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCArtistController.h"
#import "DSCArtist.h"
#import "DSCArtist+_NSJSONSerialization.h"
#import "DSCAddArtistViewController.h"

@implementation DSCArtistController

-(instancetype)init {
    if (self = [super init]) {
        _artistArray = [[NSMutableArray alloc]init];
     }
     return self;
}


-(void)saveArtist:(DSCArtist *)artist
{
    NSLog(@"from saveArtist");
    [self loadFromPersistentStore];
    [self.artistArray addObject:artist];
    [self saveToPersistentStore];
}

- (NSArray *)returnArtistArray 
{
    NSLog(@"from returnsArtistArray: %@", self.artistArray );
    return [self.artistArray copy];
}

- (void)saveArtistDictionary:(NSDictionary *)artistDictionary
{
    NSLog(@"from saved artist dictionary");
    [self.artistArray addObject:artistDictionary];
}

- (NSURL *)persistentFileURL
{
    NSURL *directory = [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    NSLog(@"fileURL: %@", fileName);
    NSLog(@"directoryURL: %@", directory);
    return [directory URLByAppendingPathComponent:fileName];
}

-(void)saveToPersistentStore
{
     NSURL *url = [self persistentFileURL];
    //artist -> innerDictionary -> middleArray -> outerDictionary -> writeTo URL
    NSMutableArray *middleArray = [[NSMutableArray alloc]init];
    
    for (DSCArtist *artist in self.artistArray)
    {
        NSDictionary *innerDictionary = [artist toDictionary];
        [middleArray addObject:innerDictionary];
    }
    NSDictionary *outerDictionary = @{ @"artists" : middleArray};
    [outerDictionary writeToURL:url atomically:YES];
    NSLog(@"URL:%@", url);
    NSLog(@"From saveToPersistentStore:%@", outerDictionary.allValues);
    return;
}

- (void)loadFromPersistentStore
{
    NSURL *url = [self persistentFileURL];
    //loadingDictionary -> middleArray -> innerDictionary -> artist -> artistArray
    NSDictionary *loadingDictionary = [NSDictionary dictionaryWithContentsOfURL:url];
    NSArray *middleArray = loadingDictionary[@"artists"];
    for (NSDictionary *innerDictionary in middleArray) {
        DSCArtist *artist = [[DSCArtist alloc]initWithDictionary:innerDictionary];
        [self.artistArray addObject:artist];
        NSLog(@"From loadPersistentStore:%@", self.artistArray);
    }
}

@end

