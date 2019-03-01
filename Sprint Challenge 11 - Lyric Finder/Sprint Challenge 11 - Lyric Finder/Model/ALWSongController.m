//
//  ALWSongController.m
//
//  EXAMPLE REQUEST
//  https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get?q_artist=coldplay&q_track=paradise

#import "ALWSongController.h"

@interface ALWSongController()
    
    @property NSString *baseURLString;
    @property NSString *apiKey;
    
@end

@implementation ALWSongController
    
- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _baseURLString = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
        _apiKey = @"cf6d82bad1msh23e41922669f60ep127ec0jsnc636b337599c";
    }
    return self;
}
    
- (void)searchLyricsWithArtist:(NSString *)songArtist andTitle:(NSString *)songTitle withCompletionBlock:(CompletionBlock)completionBlock {
    
    // Establish base url for search w/ the convenience method
    NSURL *baseURL = [NSURL URLWithString:_baseURLString];
    
    // Decompose into its components
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    // Add query items
    
    // artist
    NSURLQueryItem *firstSearchItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:songArtist];
    
    // song title
    NSURLQueryItem *secondSearchItem = [NSURLQueryItem queryItemWithName:@"q_track" value:songTitle];
    
    // Add query items to components
    [components setQueryItems:@[firstSearchItem, secondSearchItem]];
    
    // Create url with components
    //NSString *completeURLString = [components URL];
    //NSURL *url = [NSURL URLWithString:completeURLString];
    NSURL *url = [components URL];
    
    // URL Request with API Key as header
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:_apiKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    NSLog(request);
    
    // Create a data task
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *r, NSError *error) {
        if (error != nil) {
            NSLog(@"Error fetching data: %@", error);
            completionBlock(nil, error);
            return;
        }
        
        // Decode data with JSONSerialization
        // Take this object and turn it into a dictionary
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        // If it's not an NSDictionary class, give us an error
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completionBlock(nil, [[NSError alloc] init]);
            return;
        }
        
        // if it is a dictionary, make it into a model
        ALWSong *song = [[ALWSong alloc] initWithDictionary:dictionary];
        
        NSLog(@"Song lyrics are %@");
        
        
    }] resume] ;
    
}
    

@end
