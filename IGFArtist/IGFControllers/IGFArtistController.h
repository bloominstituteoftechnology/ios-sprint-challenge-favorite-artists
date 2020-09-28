//
//  IGFArtistController.h
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//

#import <Foundation/Foundation.h>

@class IGFArtist;

NS_ASSUME_NONNULL_BEGIN

@interface IGFArtistController : NSObject

@property (nonatomic, readonly) NSArray *artists;

- (void)searchForArtistByName:(NSString *)artistName completion:(void (^)(IGFArtist *artist, NSError *error))completion;

- (void)writeDictionaryToFile:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
