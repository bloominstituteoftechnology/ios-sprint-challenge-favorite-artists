//
//  SAEAudioDBFetcher.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 12/4/20.
//

#import "SAEAudioDBFetcher.h"
#import "SAEArtist.h"

static NSString *const AudioDBFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php";

@interface SAEAudioDBFetcher ()

@property (nonatomic) NSMutableArray<SAEArtist *> *internalArtists;

@end

@implementation SAEAudioDBFetcher

- (instancetype) init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchAudioDBFetcher:(NSString *)artistName completion:(AuidoDBFetcherCompletionHandler)completion
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:AudioDBFetcherBaseURLString];
    
    urlComponents.queryItems = @[
    [NSURLQueryItem queryItemWithName:@"Content-Type" value: artistName]
    ];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"Fetching Artist: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url
                               completionHandler:^(NSData *data, NSURLResponse * _Nullable response, NSError *error) {
        if (error) {
            NSLog(@"Error decoding JSON: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                 completion(nil, error);
            });
            
            return;
        }
        
        NSError *jasonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jasonError];
        
        if (!dictionary || ![dictionary isKindOfClass:NSDictionary.class]) {
            NSLog(@"Error decoding JSON: %@", jasonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, jasonError);
            });
            
            return;
        }
        
        NSDictionary *artistResult = [dictionary objectForKey:@"artists"] [0];
//        SAEArtist *newArtistResult = [[SAEArtist alloc] initWithDictionary:artistResult];
//        SAEArtist *newArtistResult = [[SAEArtist alloc] initWithArtistName:<#(nonnull NSString *)#> biography:<#(nonnull NSString *)#> yearFormed:<#(int)#>]
        
        dispatch_async(dispatch_get_main_queue(), ^ {
//            completion(newArtistResult, nil);
        });
        
    }] resume];
}

- (void) loadingArtists
{
    NSURL *documentDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent: @".plist"];
    
    NSMutableArray *artistDictionaries = [[NSDictionary alloc] initWithContentsOfURL:documentDirectory] [@"artists"];
    
    for (NSDictionary *a in artistDictionaries) {
//        SAEArtist *artist = [[SAEArtist alloc] initWithDictionary:a];
//        [self.internalArtists addObject: artist];
    }
}

-(NSArray<SAEArtist *> *)artists
{
    return [self.internalArtists copy];
}

@end
