//
//  MKArtist+NSJSONSerialization.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/16/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSKArtist.h"

NS_ASSUME_NONNULL_BEGIN
@interface MSKArtist (NSJSONSerialization)
-(instancetype)initFromDict:(NSDictionary *)dict;
-(NSDictionary *)toDict;
@end
NS_ASSUME_NONNULL_END
