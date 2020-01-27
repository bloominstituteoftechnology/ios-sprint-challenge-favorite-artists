//
//  LSIArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//



#import "LSIArtist.h"
#import "TargetConditionals.h"
#if !TARGET_OS_IOS
#import <AppKit/AppKit.h>
#endif


@interface LSIArtist (NSJSONSerialization)
- (instancetype) initWithDictionary: (NSDictionary *)dictionary;
-(NSDictionary *)artistData;

@end


