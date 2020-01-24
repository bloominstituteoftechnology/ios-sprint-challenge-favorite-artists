//
//  HSVArtistsController.h
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@class HSVArtist;


@interface HSVArtistsController : NSObject

@property (nonatomic, copy, readonly) NSArray *artists;

- (instancetype)init;

- (void) addArtist:(HSVArtist *)aritst;

- (void)fetchArtistWithName:(NSString *)name completion:(void (^)(HSVArtist *,NSError *))completion;

- (void)saveToFileDirectory;

- (void) loadFromFileDirectory;



@end

NS_ASSUME_NONNULL_END
