//
//  KMLArtistController.h
//  FavoriteArtists
//
//  Created by Keri Levesque on 4/17/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class KMLArtist;

@interface KMLArtistController : NSObject

@property (nonatomic, readonly) NSArray *artists;

- (void)searchForArtistsByName:(NSString *)name completion:(void (^)(KMLArtist *artist, NSError *error))completion;

-(void)writeDictionaryToFile:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
