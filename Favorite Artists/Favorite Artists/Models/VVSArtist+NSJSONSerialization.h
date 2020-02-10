//
//  VVSArtist+NSJSONSerialization.h
//  Favorite Artists
//
//  Created by Vici Shaweddy on 2/9/20.
//  Copyright © 2020 Vici Shaweddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVSArtist.h"

@interface VVSArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end
