//
//  LSIArtistController.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "LSIArtistController.h"


// Class Extension (Anonymous Category)

@interface LSIArtistController () {
    // private variables in here
}

// Private properties
@property NSMutableArray *internalBands;

@end




@implementation LSIArtistController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalBands = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchArtistWith:(NSString *)searchTerm
        completionBlock:(LSIArtistFetcherCompletionBlock)completionBlock {
    
    // Setup the URL
    NSURL *baseURL = @"theaudiodb.com/api/v1/json/1/search.php?s=";
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:searchTerm];
    
    NSLog(@"URL: %@", searchURL);
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        
        // Parse the data which requires just one level down... "artists" in json is really only holding one artist's info, so no need for for-in loop to extract the data since we're only grabbing ONE artist's data (ex: Ween)
        
        //NSLog(@"JSON: %@", json);
        NSArray *justOneArtistArray = json[@"artists"];   // array of the ONE Dictionary object
        
        for (NSDictionary *dict in justOneArtistArray) {
            LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:dict];
            
            if (artist) {
                // ok to put self-> to get rid of caution error?
                
                [_internalBands addObject:artist];
            }
        }
        completionBlock(_internalBands, nil);
        
    }];
    [task resume];
    
  
    // STILL NEEDS TO COMMIT TO COPY IMMUTABLE VERSION OF BANDS ARRAY WHEN READY TO PERSIST
    
    
}

- (NSUInteger)countOfArtists {
    return [_internalBands count];
}

- (void)addArtist:(LSIArtist *)artist {
    
    LSIArtist *newArtist = [[LSIArtist alloc] initWithStrArtist:artist.strArtist strBiographyEN:artist.strBiographyEN intFormedYear:artist.intFormedYear];
    
    [self.internalBands addObject:newArtist];
}

@end
