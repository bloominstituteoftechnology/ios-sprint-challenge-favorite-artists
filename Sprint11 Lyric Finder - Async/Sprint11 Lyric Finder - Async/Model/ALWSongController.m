//
//  ALWSongController.m
//  

#import "ALWSongController.h"
#import "ALWSong.h"

@interface ALWSongController ()

@property (nonatomic) NSMutableArray *internalSongs;
@property NSString *baseURLString;
@property NSString *apiKey;

@end

@implementation ALWSongController

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _internalSongs = [[NSMutableArray alloc] init];
        _baseURLString = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
        _apiKey = @"cf6d82bad1msh23e41922669f60ep127ec0jsnc636b337599c";
        
    }
    return self;
}

// Define a getter
- (NSArray *)savedSongs {
    return [self.internalSongs copy];
}

- (void)addSong:(ALWSong *)song {
    [self.internalSongs addObject:song];
}

- (void)searchForLyricsWithArtist:(NSString *)artist title:(NSString *)title withCompletionBlock:(CompletionBlock)completionBlock {
    
    // Create a URL
    NSURL *baseURL = [NSURL URLWithString:_baseURLString];
    
    // Turn it into components
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    // Add query items
    
    // artist
    NSURLQueryItem *firstSearchItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    
    // song title
    NSURLQueryItem *secondSearchItem = [NSURLQueryItem queryItemWithName:@"q_track" value:title];
    
    // Add query items to components
    [components setQueryItems:@[firstSearchItem, secondSearchItem]];
    
    // Create url with components
    NSURL *url = [components URL];
    
    // URL Request with API Key as header
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:_apiKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    NSLog(@"%@", request);
    
    // Create a data task
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error !=nil) {
            NSLog(@"Error fetching data %@", error);
            completionBlock(nil, error);
            return;
        }
        
        // Take data and turn it into a JSON object (a dictionary)
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        // Check to make sure it's a dictionary and not an array
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completionBlock(nil, error);
            return;
        }
        
        // If it is a dictionary, pull out the song lyrics
        ALWSong *song = [[ALWSong alloc] init];
        song.lyrics = [dictionary objectForKey:@"lyrics_body"];
        
        completionBlock(song, nil);
        
    }] resume] ;
}

@end
