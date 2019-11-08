//
//  LSIArtistController.h
//  FavoriteArtist
//
//  Created by Lambda_School_Loaner_214 on 11/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistController : NSObject

@property (nonatomic) NSArray *artists;

-(void)searchForArtist:(NSString *)name completion:(void (^)(LSIArtist *__nullable artist, NSError *__nullable error))completion;
-(void)saveArtist:(LSIArtist *)artist;
@end

NS_ASSUME_NONNULL_END
