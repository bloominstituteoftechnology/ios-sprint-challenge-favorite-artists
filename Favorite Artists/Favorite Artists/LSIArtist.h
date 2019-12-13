//
//  LSIArtist.h
//  Favorite Artists
//
//  Created by Isaac Lyons on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSIArtist : NSObject

@property NSString *name;
@property NSString *biography;
@property int year;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end
