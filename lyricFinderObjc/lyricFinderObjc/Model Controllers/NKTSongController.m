//
//  NKTSongController.m
//  lyricFinderObjc
//
//  Created by Nikita Thomas on 1/25/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "NKTSongController.h"
#import "NKTSong.h"

@interface NKTSongController()
@property (nonatomic, copy) NSMutableArray *songs;
@end

@implementation NKTSongController

static NSString *baseUrlString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";

- (instancetype)init
{
    self = [super init];
    if (self) {
        _songs = [@[]mutableCopy];
    }
    return self;
}

- (NSArray *)songsProperty
{
    return [self songs];
}


- (void)getLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(NSString * _Nonnull, NSError * _Nonnull))completion
{
    // Turl url string into a URL object
    NSURL *baseURL = [NSURL URLWithString:baseUrlString];
    
    // Get the search parameters
    NSURLQueryItem *artistQueryItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    NSURLQueryItem *titleQueryItem = [NSURLQueryItem queryItemWithName:@"q_track" value:title];
    
    // Build a components object from our url
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    // Add our parameters onto the components object
    [urlComponents setQueryItems:@[artistQueryItem, titleQueryItem]];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:urlComponents.URL];
    
    // Add the api key onto the header
    [urlRequest setValue:@"yWB9mTltoqmshJYNabHtYPWYvAibp1qhExijsn7qNCcGLAhiG4" forHTTPHeaderField:@"X-Mashape-Key"];
    
    // DataTask
    [[[NSURLSession sharedSession]dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"Error with getting lyrics dataTask: %@", error);
            completion(nil, error);
            return;
        }
        
        if (data == nil)
        {
            NSLog(@"Got no data from dataTask searching for lyrics");
            completion(nil, nil);
        }
        
        NSString *testJSON = @" \
        { \
        \"lyrics_id\": 7650688, \
        \"restricted\": false, \
        \"instrumental\": false, \
        \"lyrics_body\": \"When she was just a girl...\\n\\n\", \
        \"lyrics_language\": \"en\", \
        \"script_tracking_url\": \"http://tracking.musixmatch.com/t1.0/GR6Q97jE/\", \
        \"pixel_tracking_url\": \"http://tracking.musixmatch.com/t1.0/O+uCbCYZ50IP8zibMOqQz2+cq5dy1Pz9nQVd8BZap1EL6+OfjEXUlyasewf3QW7gBY4/5kyfynZFKchgk6p7KP3dGlgHfbwCrWLHvIGxH98ZBN74uBTD8ww1/\", \
        \"html_tracking_url\": \"http://tracking.musixmatch.com/t1.0/mzoCLtOg7U2B2B6ROdSvu+HvAFuzkE0/cTF/\", \
        \"lyrics_copyright\": \"Lyrics powered by www.musiXmatch.com. This Lyrics is NOT for Commercial use and only 30% of the lyrics are returned.\", \
        \"updated_time\": \"2012-08-24T10:15:05Z\" \
        } \
        ";
        
        NSData *testData = [testJSON dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:testData options:0 error:nil];
        NSLog(@"dict, %@", dict);
        
        
        // Check to make sure that our data correctly turned into a dictionary object
        if (![dict isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Could not turn JSON data into a dictionary");
            completion(nil, nil);
            return;
        }
        
        // At this point, we're guaranteed to have a dictionary from the JSON
        
        NSString *lyrics = dict[@"lyrics_body"];
        completion(lyrics, nil);
        
    }]resume];

}

- (void)newSongWithTitle:(NSString *)title artist:(NSString *)artist rating:(NSInteger)rating lyrics:(NSString *)lyrics
{
    // Create song object
    NKTSong *song = [[NKTSong alloc]initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    
    // Add song with the lyrics to the songs array
    [[self songs]addObject:song];
    
    // TODO: CoreData save function would go here
}

- (void)saveSong
{
    NSURL *documentsDir = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"savedSongs.json"];
    
    NSMutableArray *songSavableDicts = [[NSMutableArray alloc]init];
    
    
    // Loop through songs and convert them to dictionary format for saving
    for(NKTSong *song in self.songs)
    {
        // Either use jsonSerialization or manually build the dictionary.
        // 
        // Rating number must be converted to NSNumber
        NSDictionary *songDict = @{@"title": song.title, @"artist": song.artist, @"lyrics": song.lyrics, @"rating": [NSNumber numberWithInt:song.rating]};
        
        [songSavableDicts addObject:songDict];
    }
    
    // Turn array of song dictionaries into data
    NSData *data = [NSJSONSerialization dataWithJSONObject:songSavableDicts options:0 error:nil];
    
    // Write data to the url
    [data writeToURL:documentsDir atomically:YES];
    
}

- (void)loadSongs
{
    NSURL *documentsDir = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:@"savedSongs.json"];
    
    // Get the data from documents
    NSData *data = [NSData dataWithContentsOfURL:documentsDir];
    
    if (data == nil) {
        NSLog(@"Got not data from documents Dir");
        return;
    }
    
    // Turn data into array of song dictionaries
    NSArray *songDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    for (NSDictionary *songDict in songDictionaries)
    {
        NKTSong *song = [[NKTSong alloc] initWithDictionary:songDict];
        [self.songs addObject:song];
    }
    
    
}



- (void)updateSong:(NKTSong *)song title:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger *)rating
{
    
    long songIndex = [self.songs indexOfObject:song];
    [_songs removeObjectAtIndex:songIndex];
    
    // Create song object
    NKTSong *newSong = [[NKTSong alloc]initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    
    // Add song with the lyrics to the songs array
    [[self songs]addObject:newSong];
    
//    NKTSong *newSong = self.songsProperty[songIndex];
//
//    [newSong setTitle: title];
//    [newSong setArtist: artist];
//    [newSong setLyrics: lyrics];
//    [newSong setRating: *rating];
}


@end
