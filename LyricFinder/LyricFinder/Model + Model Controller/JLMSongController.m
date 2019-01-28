//
//  JLMSongController.m
//  LyricFinder
//
//  Created by Jason Modisett on 1/25/19.
//  Copyright © 2019 Jason Modisett. All rights reserved.
//

#import "JLMSongController.h"
#import "JLMSong.h"
#import "JLMSong+NSJSONSerialization.h"

@interface  JLMSongController ()

@property (nonatomic, copy) NSMutableArray *internalSongs;

@end

@implementation JLMSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [@[] mutableCopy];
        [self loadSongs];
    }
    return self;
}

- (void)createSongWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    JLMSong *song =  [[[JLMSong alloc] init] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [self.internalSongs addObject:song];
    [self saveSong];
}


- (void)saveSong
{
    NSURL *documentDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"songs.json"];
    
    NSMutableArray *songDictionaries = [[NSMutableArray alloc] init];
    
    for(JLMSong *internalSong in self.internalSongs) {
        NSDictionary *songDictionary = @{@"title": internalSong.title,
                                         @"artist": internalSong.artist,
                                         @"lyrics": internalSong.lyrics,
                                         @"rating": [NSNumber numberWithInteger:internalSong.rating]};
        [songDictionaries addObject:songDictionary];
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:songDictionaries options:0 error:nil];
    [data writeToURL:documentDirectory atomically:YES];
}

- (void)loadSongs
{
    NSURL *documentDirectory = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"songs.json"];
    
    NSData *data = [NSData dataWithContentsOfURL:documentDirectory];
    
    if(!data) {
        return;
    }
    
    NSArray *songDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    for(NSDictionary *songDictionary in songDictionaries) {
        JLMSong *song = [[JLMSong alloc] initWithDictionary: songDictionary];
        [self.internalSongs addObject:song];
    }
}

- (void)updateSongWithSong:(JLMSong *)song title:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    unsigned long index = [self.internalSongs indexOfObject:song];
    JLMSong *existingSong = self.internalSongs[index];
    [existingSong setTitle: title];
    [existingSong setArtist: artist];
    [existingSong setLyrics: lyrics];
    [existingSong setRating: rating];
}

- (void)searchForLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString *lyrics, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *artistQueryItem = [[NSURLQueryItem alloc] initWithName:@"q_artist" value:artist];
    NSURLQueryItem *titleQueryItem = [[NSURLQueryItem alloc] initWithName:@"q_track" value:title];
    
    [components setQueryItems: @[artistQueryItem, titleQueryItem]];
    NSURL *URL = [components URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    [request setValue:APIKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error searching for person: %@", error);
            completion(nil, error);
            return;
        }

        if(!data) {
            NSLog(@"No data returned from data task");
            completion(nil, [[NSError alloc] init]);
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        if (![dictionary isKindOfClass: [NSDictionary class]]) {
            NSLog(@"JSON is not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSString *lyrics = dictionary[@"lyrics_body"];
        
        
        completion(lyrics, nil);
        
    }] resume];
}

- (void)changeRatingOfSong:(JLMSong *)song rating:(NSInteger)rating
{
    song.rating = rating;
}

-(NSArray *)songs {
    return [self.internalSongs copy];
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
static NSString * const APIKey = @"PJqtq9cUrumshDECZcaVAnGsycRcp15ejX3jsn2HtbcCWVeLRX";

static NSString * const testJSON = @" \
{ \
\"lyrics_id\": 7650688, \
\"restricted\": false, \
\"instrumental\": false, \
\"lyrics_body\": \"Thought I'd end up with Sean\\nBut he wasn't a match\\nWrote some songs about Ricky\\nNow I listen and laugh\\nEven almost got married\\nAnd for Pete I'm so thankful\\nWish I could say thank you to Malcolm\\n'Cause he was an angel\\n\\nOne taught me love\\nOne taught me patience\\nAnd one taught me pain\\nNow I'm so amazin'\\nSay I've loved and I've lost\\nBut that's not what I see\\nLook what I've got\\nLook what you taught me\\nAnd for that I say\\n\\nThank you, next (next)\\nThank you, next (next)\\nThank you, next\\nI'm so, I'm so grateful for my ex\\nThank you, next (next)\\nThank you, next (next),\\nThank you, next\\nI'm so, I'm so grateful\", \
\"lyrics_language\": \"en\", \
\"script_tracking_url\": \"http://tracking.musixmatch.com/t1.0/GR6Q97jE/\", \
\"pixel_tracking_url\": \"http://tracking.musixmatch.com/t1.0/O+uCbCYZ50IP8zibMOqQz2+cq5dy1Pz9nQVd8BZap1EL6+OfjEXUlyasewf3QW7gBY4/5kyfynZFKchgk6p7KP3dGlgHfbwCrWLHvIGxH98ZBN74uBTD8ww1/\", \
\"html_tracking_url\": \"http://tracking.musixmatch.com/t1.0/mzoCLtOg7U2B2B6ROdSvu+HvAFuzkE0/cTF/\", \
\"lyrics_copyright\": \"Lyrics powered by www.musiXmatch.com. This Lyrics is NOT for Commercial use and only 30% of the lyrics are returned.\", \
\"updated_time\": \"2012-08-24T10:15:05Z\" \
} \
";

@end
