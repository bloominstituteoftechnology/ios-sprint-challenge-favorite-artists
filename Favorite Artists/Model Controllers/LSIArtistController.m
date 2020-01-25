//
//  LSIArtistController.m
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"
#import "NSJSONSerialization+LSIYuorArtistModel.h"

// Declare here private properties
@interface LSIArtistController ()

//@property LSIArtist *fetchedArtist;

@property NSMutableArray *internalFavArtists;

@end

@implementation LSIArtistController



// Computed property
- (NSArray *)favoriteArtists {
    return self.internalFavArtists;
}

static NSString *const baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

NSString *apiKey = @"1";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalFavArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchArtistWithSearchTerm:(NSString *)searchTerm
                               completion:(void (^)(NSError *error))completion {
    
    
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    ////
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
//    urlComponents.path = apiKey;
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:searchTerm]];
    NSLog(@"urlComponents before data task: %@",urlComponents);
    
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL before data task: %@",url.absoluteString);
    ////
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Data: %@", data);
        
        if (error) {
            NSLog(@"NSURLsession.Error: %@", error);
            completion(error);
            return;
        }
        
        NSLog(@"Data: %@", data);
        
        NSError *jsonError = nil;
        NSError *noDictionaryError = nil;
        
        // Taking the JSON and turning it into an Artist
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSLog(@"json: %@",[json descriptionInStringsFileFormat]);
        NSLog(@"Data: %@", data);
        
        if (jsonError) {
            completion(nil);
            return;
        }
        
        NSLog(@"JSON: %@", json);
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected");
            completion(noDictionaryError);
        }
        
        // getting the array "artists" from the json
        
        NSMutableArray *fetchedArtistInfo = json[@"artists"];
        //        LSIArtist *fetchedArtist;
        
        for (NSDictionary *dictionary in fetchedArtistInfo) {
            LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:dictionary];
            [self.internalFavArtists addObject:artist];
            self.fetchedArtist = artist;
        }

        completion(nil);
        

    }];
    task.resume;
//    return self.fetchedArtist;
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
