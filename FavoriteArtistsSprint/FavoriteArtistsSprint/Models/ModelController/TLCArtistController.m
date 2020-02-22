//
//  TLCArtistController.m
//  FavoriteArtistsSprint
//
//  Created by Lambda_School_Loaner_219 on 2/21/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCArtistController.h"
#import <Foundation/Foundation.h>
#import "TLCArtist+JSON.h"
#import "LSIFileHelper.h"
#import "LSIErrors.h"

@interface TLCArtistController()
@property (nonatomic) NSDictionary *artistDictionary;

-(void)loadArtistDictionary;
-(NSURL *)artistsFileURL;

@end


@implementation TLCArtistController


static NSString * const baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

-(instancetype)init
{
    self = [super init];
    if (self) {
        _artistDictionary = @{
            @"artists" : [[NSMutableArray alloc] init]
        };
        [self loadArtistDictionary];
        
    }
    return self;
}

-(NSArray *)artists {
    NSMutableArray *artistArray = [[NSMutableArray alloc] init];
    NSArray *artistDictionaries = self.artistDictionary[@"artists"];
    for (NSDictionary *artists in artistDictionaries) {
        TLCArtist *artist = [[TLCArtist alloc] initWithDictionary: artists];
        [artistArray addObject:artist];
    }
    return [artistArray copy];
}

-(void)searchForArtists:(NSString *)name completion:(void (^)(TLCArtist *, NSError *))completion {
    NSLog(@"DEBUGGING SearchForArtists executing");
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName: @"s" value:name];
    
    components.queryItems = @[searchItem];
    
    NSURL *url = components.URL;
    //if ([anArchiver isMemberOfClass:[NSCoder class]])
    if ( ![url isMemberOfClass: [NSURL class]])
        NSLog(@"I am not a url");
        return
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
       
        NSError *jsonError = nil;
       
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
            NSLog(@"Returning with json Error");
            return;
        }
        
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSError *dictionaryError = [[NSError alloc] init];
            completion(nil, dictionaryError);
            return;
        }
        
        NSArray *artistDictionaries = dictionary[@"artists"];
        if ([artistDictionaries isEqual:nil]) {
            NSLog(@"artistDictionaries came back nil");
            return; }
        NSLog(@"JSON: %@", dictionary);
        TLCArtist *artist = [[TLCArtist alloc] initWithDictionary:artistDictionaries[0]]; //first dict only
        
        if ([dictionary[@"name"] isKindOfClass:[NSNull class ]]) {
           
            NSLog(@"Returning from null error for dict value");
            return completion(nil, error);
            
        
            
            
            
            
            
    
        }
        
        if (!artist) {
            NSString *errorMessage = [NSString stringWithFormat:@"Unable to parse json object. %@", artistDictionaries[0]];
            NSError *parsingError = errorWithMessage(errorMessage, jsonError);
            completion(nil, parsingError);
            
        }
        
        
        
        
        completion(artist, nil);
    }] resume];
    }
      
      
      
      
      
      
     


-(void) saveDictionary:(NSDictionary *)dictionary {
    NSURL *fileURL = [self artistsFileURL];
    // sanity check
    NSLog(@"Your saving to this URL: %@", fileURL);
    NSError *saveToURLError = nil;
    
    [self.artistDictionary[@"artists"] addObject:dictionary];
    //should be populated now ^^
    
    if([self.artistDictionary writeToURL:fileURL error: &saveToURLError]) {
        
    }
}

-(void)loadArtistDictionary {
    NSDictionary *artistDictionary = [NSDictionary dictionaryWithContentsOfURL:[self artistsFileURL] error: NULL];
    NSArray *artistDictionaries = artistDictionary[@"artists"];
    for (NSDictionary *artistsInDict in artistDictionaries) {
        if (artistsInDict != nil) {
        [self.artistDictionary[@"artists"] addObject: artistsInDict];
    }
    } }

-(NSURL *) artistsFileURL {
    NSURL *documentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *fileName = @"artists.json";
    return [documentDirectory URLByAppendingPathComponent:fileName];
    
    
                                 
                                
}



@end
