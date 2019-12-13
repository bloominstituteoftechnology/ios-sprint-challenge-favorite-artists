//
//  JLRFavoriteArtists2+Convenience.h
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Artist+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface Artist (Convenience)

- (instancetype)initWithName:(NSString *)name bio:(NSString *)bio formed:(NSDate *)formed context:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
