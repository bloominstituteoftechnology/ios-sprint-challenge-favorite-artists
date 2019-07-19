//
//  NSJSONSerialization+Translations.h
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization_Translations : NSJSONSerialization

//- (NSDictionary)translateToDictionary:(LSIArtist)artist;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
