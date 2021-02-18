//
//  SAEArtistController.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 2/15/21.
//

#import <Foundation/Foundation.h>
#import "SAEArtist.h"

typedef void (^SAEArtistControllerCompletionHandler) (SAEArtist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface SAEArtistController : NSObject

@property (readonly, nonatomic) SAEArtist *currentArtist;
@property (nonatomic,readonly,copy) NSArray *saveArtists;


-(void)searchArtist:(NSString *)searchArtist completionHandler:(SAEArtistControllerCompletionHandler)completionHandler;

-(void)addArtists:(SAEArtist *)artist;

-(void)loadFromPersistentStore;

@end

NS_ASSUME_NONNULL_END
