//
//  MJRArtist+MJRNSJSONSerialization.h
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import "MJRArtist.h"

@interface MJRArtist (MJRNSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)artistData;
- (NSString *)formedInYearDesc;

@end
