//
//  LAArtistController.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//


#import "LAArtistController.h"
#import "LAArtist.h"
#import "LAArtist+NSJSONSerialization.h"

@interface LAArtistController() {
    
}

@property(nonatomic, readwrite) NSMutableArray *internalArtists;

@end

@implementation LAArtistController

-(instancetype)init {
    self = [super init];
    if (self){
        _internalArtists = [[NSMutableArray alloc]init];
    }
    return self;
}



- (void)addArtist:(LAArtist *)artist {
    [self.internalArtists addObject: artist];
}

-(NSArray *)artists {
    return self.internalArtists; //_internalArtists
}

- (LAArtist *)fetchSavedArtist:(LAArtist *)artist{
    NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    
    
    NSURL *artistURL = [[documentDirectory URLByAppendingPathComponent:artist.name] URLByAppendingPathComponent:@"json"];
    NSLog(@"Where the saved artist is: %@", artistURL.absoluteString);
    
    NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];
    
    NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:NULL];
    
    LAArtist *savedArtist = [[LAArtist alloc] initWithDictionary:artistDictionary];
    return savedArtist;
}

@end
