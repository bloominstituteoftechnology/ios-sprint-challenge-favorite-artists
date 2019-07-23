//
//  LSIArtistController.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "LSIArtistController.h"
#import "NSJSONSerialization+Translations.h"


// Class Extension (Anonymous Category)

@interface LSIArtistController () {  // EXTENSION
    // Do private properties go inside this ModelController interface brackets? Or below that where i have them, and they are working?
}

// Private properties
@property NSMutableArray *internalBands;
@property LSIArtist *fetchedArtist;

@end




@implementation LSIArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalBands = [[NSMutableArray alloc] init];
        _fetchedArtist = [[LSIArtist alloc] init];
    }
    return self;
}


- (void)fetchArtistWith:(NSString *)searchTerm
        completionBlock:(LSIArtistFetcherCompletionBlock)completionBlock {
    
    
    
    // Setup the URL
    NSString *baseURL = @"https://theaudiodb.com/api/v1/json/1/search.php?s=";
    NSString *searchURLString = [NSString stringWithFormat:@"%@%@", baseURL,
     searchTerm];
    NSURL *searchURL = [NSURL URLWithString:searchURLString];
    
    // DELETE AFTER SUCCESSFUL RUN
    NSLog(@"URL: %@", searchURL);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // check to see if we have data....  DELETE AFTER RUNNING
        //NSLog(@"Data: %@", data);
        
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        if (data) {
            
            NSError *jsonError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
            if (jsonError) {
                NSLog(@"JSON Error: %@", jsonError);
                completionBlock(nil, jsonError);
                return;
            }
            
            // load json "artists" indexed values into an array
            NSArray *artistJSON = json[@"artists"];
            
            // loop thru the array of artist (say Ween) features to extract the ones we want using our model's dictionary initializer
            for (NSDictionary *artistQualitiesDictionary in artistJSON) {
                
                _fetchedArtist = [[LSIArtist alloc] initWithDictionary:artistQualitiesDictionary];
                NSLog(@"Artist Dictionary %@", _fetchedArtist);
                
//                if (self.internalBands) {
//                    // ok to put self-> to get rid of caution error?
//
//                    [self.internalBands addObject:artist];
//                }
            // "artists" is a misnomer here, it's actually an array of artist attributes for ONE artist
            }
            
            completionBlock(_fetchedArtist, nil);    // 2. changed all _internalBands to self.internalBands
        }
        
    }];
    [task resume];
}

- (NSUInteger)countOfArtists {
    return [_internalBands count];
}

- (void)addArtist:(LSIArtist *)artist {
    
    LSIArtist *newArtist = [[LSIArtist alloc] initWithStrArtist:artist.strArtist strBiographyEN:artist.strBiographyEN intFormedYear:artist.intFormedYear];
    
    [self.internalBands addObject:newArtist];
    
    
    //how do i tell bands to get a copy of internal bands? don't i just call the function below?
}

- (NSArray *)bands {
    // We create a copy to make NSMutableArray into a
    // NSArray (immutable, aka: a let constant from Swift)
    
    
    return [self.internalBands copy];    //1. i changed _bands to _internalBands
}

@end



// For when implementing FILE-MANAGER
//-(void)saveArtist:(LSIArtist *)artistToSave {
//    if (artistRetrieved) {
//        NSData *data = [NSJSONSerialization dataWithJSONObject:[artistToSave artistData] options:0 error:nil];
//        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
//        NSURL *url = [[directory URLByAppendingPathComponent:self.artistgotten.strArtist] URLByAppendingPathExtension:@"json"];
//
//        [data writeToURL:url atomically:YES];
//    } else {
//        NSLog(@"Error saving");
//        return;
//    }
//    return;
//}

