//
//  BFVArtist+Convenience.h
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BFVArtist+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFVArtist (Convenience)
- (instancetype)initWithBandName:(NSString *)bandName yearFormed:(int_fast64_t)yearFormed biography:(NSString *)biography context:(NSManagedObjectContext *)context;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
