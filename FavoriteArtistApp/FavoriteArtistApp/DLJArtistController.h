//
//  DLJArtistController.h
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLJArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^DLJCompletionBlock)(DLJArtist *, NSError *);



@interface DLJArtistController : NSObject

-(void)fetchArtistsWithName:(NSString *)name completion:(void (^)(NSError *))completion;

-(void)saveArtist:(DLJArtist *)artist;



@property(nonatomic, readonly) NSArray *artistArray;

@end

NS_ASSUME_NONNULL_END
