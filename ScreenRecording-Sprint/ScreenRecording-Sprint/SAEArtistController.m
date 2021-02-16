//
//  SAEArtistController.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 2/15/21.
//

#import "SAEArtist.h"
#import "SAEArtist+NSJSONSerialization.h"
#import "SAEArtistController.h"

@interface SAEArtistController (){}

@property (nonatomic) NSMutableArray *saveArtistsItems;

@end


@implementation SAEArtistController

static NSString *const searchBaseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

- (NSURL *)persistURL {
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *path = @"artist.json";
    return [url URLByAppendingPathComponent:path];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _saveArtistsItems = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)saveToPersistentStore {
    NSError *error = nil;
    NSURL *persistURL = [self persistURL];
    
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (SAEArtist *artist in self.saveArtists) {
        NSDictionary *artistDictionary = [artist toDictionary];
        [artists addObject: artistDictionary];
    }
    
    
}

//- (void)loadFromPersistentStore {
//    NSURL *url = [self persistURL];
//
//    NSDictionary *artistDictionaries = dict
//}



@end
