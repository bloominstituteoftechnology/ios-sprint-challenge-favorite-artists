//
//  SAEArtistController.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 2/15/21.
//

#import "SAEArtist.h"
#import <Foundation/Foundation.h>

@class SAEArtist;

typedef void (^NTSearchArtist) (SAEArtist * _Nullable artistsName, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface SAEArtistController : NSObject

-(void)addArtist:(SAEArtist *)artist;
-(void)saveArtist:(SAEArtist *)artist;
-(void)searchArtist:(NSString *)name completion:(NTSearchArtist)completion;
-(void)loadFromPersistentStore;

@property (nonatomic, readonly, copy) NSArray *saveArtists;
@property (nonatomic, readonly, copy) SAEArtist *currentArtists;

@end

NS_ASSUME_NONNULL_END
