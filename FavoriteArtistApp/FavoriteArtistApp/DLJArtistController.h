//
//  DLJArtistController.h
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DLJArtist;

@interface DLJArtistController : NSObject

-(void)fetchArtistsWithName:(NSString *)name completion:(void (^)(NSError *))completion;

-(void)createArtist:(NSString *)name bio:(NSString *)bio yearFound:(int)yearFounded;

@property NSMutableArray *artistArray;

@end

NS_ASSUME_NONNULL_END
