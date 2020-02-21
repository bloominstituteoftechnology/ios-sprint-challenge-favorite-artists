//
//  NSManagedObject+CARHelpers.h
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObject (CARHelpers)

+ (NSString *)entityName;

+ (instancetype)insertNewObjectInContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
