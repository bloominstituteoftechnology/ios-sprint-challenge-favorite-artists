//
//  LSIArtistController.m
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

// Declare here private properties
@interface LSIArtistController ()

@property NSMutableArray *internalFavArtists;

@end

@implementation LSIArtistController



// Computed property
- (NSArray *)favoriteArtists {
    return self.internalFavArtists;
}

static NSString *const baseURLString = @"https://www.theaudiodb.com/api/v1/json";

NSString *apiKey = @"1";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalFavArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchForArtist:(void (^)(NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(error);
            return;
        }
        
        NSError *jsonError = nil;
        NSError *noDictionaryError = nil;
        
        // Taking the JSON and turning it into an Artist
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil);
            return;
        }
        
        // if it's not a Dictionary
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected");
            completion(noDictionaryError);
        }
        
        // getting the array "artists" from the json
        NSArray *fetchedArtistInfo = json[@"artists"];
        
        
    }];
    [dataTask response];
}


- (LSIArtist *)AddArtistWithName:(NSString *)name
                       biography:(NSString *)biography
                      yearFormed:(int)yearFormed {
    
    NSNumber *yearNumber = [NSNumber numberWithInt:yearFormed];
    
    LSIArtist *artist = [[LSIArtist alloc]initWithName:name biography:biography yearFormed:yearNumber];
    
    // TODO : Add it to the favorites array
    
    return artist;
}


- (void)deleteArtist:(LSIArtist *)artist {
    
}

@end
