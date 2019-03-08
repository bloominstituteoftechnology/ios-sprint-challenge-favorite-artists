//
//  LSILyricsController.m
//  LSILyric FInder
//
//  Created by Iyin Raphael on 3/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSILyricsController.h"
#import "LSILyric.h"

static NSString *baseURLString = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
static NSString *APIKey = @"aa59cb9a79msh779d707588a8c4dp1c6716jsn128fc0486c67";

@class LSILyric;

@interface LSILyricsController()

@property NSMutableArray *internalArray;

@end

@implementation LSILyricsController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.internalArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createLyrics:(NSString *)artistName title:(NSString *)title lyrics:(NSString *)lytrics rating:(NSInteger)rating
{
    LSILyric *lyricsNew = [[LSILyric alloc] initWithTitle:title arstistName:artistName lyrics:lytrics rating:rating];
    [self.internalArray addObject:lyricsNew];
    self.lyricsArray = self.internalArray;
}


- (void)fetchLyricswithArtistName:(NSString *)artistName title:(NSString *)title completionBlock:(ControllerCompletionBlock)completionBlock
{
     NSURLComponents *urlComponents = [NSURLComponents componentsWithString: baseURLString];
    NSMutableArray *queryItem = [@[[NSURLQueryItem queryItemWithName:@"q_artist" value: artistName],
                                   [NSURLQueryItem queryItemWithName:@"q_track" value: title]] mutableCopy];
    
    urlComponents.queryItems = queryItem;
    NSURL *requestURL = urlComponents.URL;
    
     NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setValue: APIKey forHTTPHeaderField:@"X-RapidAPI-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Erro fetching data: %@", error);
            completionBlock(nil,error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!dictionary) {
            NSLog(@"Error decoding json: %@", error);
            completionBlock(nil,error);
            return;
        }
        
        NSString *lyricsBody = dictionary[@"lyrics_body"];
        completionBlock(lyricsBody,nil);
        return;
        
    }]resume];
}

@end
