//
//  MRFArtistController.m
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtistController.h"
#import "MRFArtist.h"

@interface MRFArtistController () {
}
//private properties
@property NSMutableArray *internalArtists;
@end

@implementation MRFArtistController

- (NSArray *)artists {
    return [ _internalArtists copy ];
}

- (NSURL *)persistentURL {
    //get document directory
    NSFileManager *fileManager = [[NSFileManager defaultManager] init];
    NSURL *url = [[fileManager URLsForDirectory: NSDocumentDirectory inDomains: NSUserDomainMask] firstObject];
    NSURL *fileName = [url URLByAppendingPathComponent:@"artist.json"];
    return fileName;
}

- (void)createArtistWithName:(NSString *)name yearFormed:(int)yearFormed bio:(NSString *)bio {
    MRFArtist *artist = [[MRFArtist alloc] initWithArtistName:name yearFormed:yearFormed bio:bio];
    
    [_internalArtists addObject:artist];
    NSLog(@"Artist in the actual create function: %d", artist.yearFormed);
    NSLog(@"Artist array count: %lu", _internalArtists.count);
    
    self.saveToPersistenceStore;
}

- (void)saveToPersistenceStore {
    if (_persistentURL !=nil){
         NSError *jsonError = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:_internalArtists options:0 error:&jsonError];
            [data writeToURL:_persistentURL atomically:YES];
        
    } else {
        NSLog(@"Error with persinstent URL");
        return;
    }
}

- (void)loadFromPersistenceStore {
    NSFileManager *fileManger = [NSFileManager defaultManager];
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentDirectory stringByAppendingString:@"artist.json"];
    if ([fileManger fileExistsAtPath:filePath]){
        //path exists
        NSData *data = [NSData dataWithContentsOfURL:_persistentURL];
        NSError *jsonError = nil;
        MRFArtist *artist = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        
        [_internalArtists addObject:artist];
        
    } else {
            //file doesn't exist
        NSLog(@"Error loading from persistent store");
        return;
    }
}


@end
