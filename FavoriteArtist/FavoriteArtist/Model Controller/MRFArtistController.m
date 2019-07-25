//
//  MRFArtistController.m
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtistController.h"
#import "MRFArtist.h"
#import "MRFArtist+MRFJSONSerialization.h"
@interface MRFArtistController () {
}
//private properties
@property NSMutableArray *internalArtists;
@end

@implementation MRFArtistController

- (NSArray *)artists {
    return [  self.internalArtists copy ];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}
- (NSURL *)persistentURL {
    //get document directory
    NSFileManager *fileManager = [[NSFileManager defaultManager] init];
    NSURL *url = [[fileManager URLsForDirectory: NSDocumentDirectory inDomains: NSUserDomainMask] firstObject];
    NSURL *fileName = [url URLByAppendingPathComponent:@"artist.json"];
    NSLog(@"fileName: %@",fileName);
    return fileName;
}

- (void)createArtistWithName:(NSString *)name yearFormed:(NSString *)yearFormed bio:(NSString *)bio {
    MRFArtist *artist = [[MRFArtist alloc] initWithArtistName:name yearFormed:yearFormed bio:bio];
    
    
    [self.internalArtists addObject:artist];
    [self.artists arrayByAddingObjectsFromArray:self.internalArtists];
    NSLog(@"Do we have an artist? Yes, artist yearFormed property: %@", artist.yearFormed);
    NSLog(@"_internalArtists array count: %lu", self.internalArtists.count);
    NSLog(@"Artists array count: %lu", self.artists.count);
    [self saveToPersistenceStoreWithArtist:artist];
}

- (void)saveToPersistenceStoreWithArtist:(MRFArtist *)artist { //should this have an artist as a parameter so we can turn it into a dictionary so we can use jsonserialization?
    NSError *jsonError = nil;
    if (self.persistentURL !=nil){
        NSDictionary *artistDictionary = [artist toDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:artistDictionary options:0 error:&jsonError];
        
        if (jsonError){
            NSLog(@"Error converting data into json object:%@", jsonError);
        }
        
        jsonError = nil;
        
        [data writeToURL:self.persistentURL options:0 error:&jsonError];
        
        if (jsonError){
            NSLog(@"Error saveing file to disk:%@", jsonError);
        }
        
        NSLog(@"AYE THIS WORKED!!!!");
    } else {
        NSLog(@"persistent store:%@", self.persistentURL);
        return;
    }
}

- (void)loadFromPersistenceStore {
    NSFileManager *fileManger = [NSFileManager defaultManager];
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentDirectory stringByAppendingString:@"artist.json"];
    
    if ([fileManger fileExistsAtPath:self.persistentURL.path]){
//        if (self.persistentURL != nil){
        //path exists
        NSData *data = [NSData dataWithContentsOfURL:self.persistentURL];
        NSError *jsonError = nil;
        NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        MRFArtist *artist = [[MRFArtist alloc] initWithDictionary:artistDictionary];
        NSLog(@"Artist from loading function: %@",artist.artist);
        
        if (jsonError){
            NSLog(@"Error loading:%@",jsonError);
        }
        
        [self.internalArtists addObject:artist];
        
    } else {
            //file doesn't exist
        NSLog(@"Error loading from persistent store");
        
        return;
    }
}

@end
