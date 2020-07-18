//
//  JEVArtistController.h
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JEVArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JEVArtistController : NSObject

@property (nonatomic, copy) NSMutableArray *privateArtists;
@property NSURL *baseURL;

- (NSArray *) artists;
- (void) addArtist:(JEVArtist *)artist;
- (void) saveArtist;
- (NSArray *) loadArtists;

- (instancetype) init;
- (void)findArtistWithName:(NSString *)name
                completion:(void (^)(JEVArtist*))completion;

@end

NS_ASSUME_NONNULL_END
