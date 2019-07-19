//
//  LSIArtistController.h
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIArtist.h"


NS_ASSUME_NONNULL_BEGIN

NSString *baseURL = @"theaudiodb.com/api/v1/json/1/search.php?s="


@interface LSIArtistController : NSObject

@property /* (nonatomic) */ NSArray *bands;     //not sure why i'd need to specify nonatomic here



@end

NS_ASSUME_NONNULL_END
