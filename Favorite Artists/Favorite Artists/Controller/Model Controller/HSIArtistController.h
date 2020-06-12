//
//  HSIArtistController.h
//  Favorite Artists
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HSIArtist;


NS_ASSUME_NONNULL_BEGIN

@interface HSIArtistController : NSObject

@property (nonatomic, copy) NSMutableArray *privateArtists;
@property NSURL *baseURL;

- (void)addArtist:(HSIArtist *)artist;
- (void)saveArtists;
- (NSArray *)loadArtists;

- (instancetype)init;
- (void)findArtistWithName:(NSString *)name completion:(void (^)(HSIArtist *))completion;

@end

NS_ASSUME_NONNULL_END
