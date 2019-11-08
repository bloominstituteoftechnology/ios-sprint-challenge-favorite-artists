//
//  CDBFavArtist.h
//  FavoriteArtist
//
//  Created by Ciara Beitel on 11/8/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDBFavArtist : NSObject

@property NSString *name;
@property NSString *year;
@property NSString *biography;

- (instancetype) initWithName:(NSString *)name yearFormed:(NSString *)year biography:(NSString *)biography;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

