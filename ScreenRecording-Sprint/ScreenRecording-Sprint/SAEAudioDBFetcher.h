//
//  SAEAudioDBFetcher.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 12/4/20.
//

#import <Foundation/Foundation.h>

@class SAEArtist;

//NS_ASSUME_NONNULL_BEGIN

typedef void (^AuidoDBFetcherCompletionHandler)(SAEArtist *artist, NSError *error);

@interface SAEAudioDBFetcher : NSObject

@property (nonatomic, readonly, copy) NSArray<SAEArtist *> *artists;

- (void)fetchAudioDBFetcher:(NSString *)artist completion:(AuidoDBFetcherCompletionHandler)completion;
- (void)loadingArtists;

@end

//NS_ASSUME_NONNULL_END
