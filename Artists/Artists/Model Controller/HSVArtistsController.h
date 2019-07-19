//
//  HSVArtistsController.h
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HSVArtistsController : NSObject

@property (nonatomic, copy, readonly) NSArray *artists;

- (instancetype)init;

- (void) createArtistWithName:(NSString *)name biography:(NSString *)bio yearFormed:(int)formedYear;

- (void)fetchArtistWithName:(NSString *)name completion:(void (^)(NSError *))completion;


@end

NS_ASSUME_NONNULL_END
