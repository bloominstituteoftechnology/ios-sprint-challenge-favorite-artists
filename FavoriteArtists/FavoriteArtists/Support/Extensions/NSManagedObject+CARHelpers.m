//
//  NSManagedObject+CARHelpers.m
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "NSManagedObject+CARHelpers.h"
#import "CARArtist+CoreDataProperties.h"
#import "CARArtist+CoreDataClass.h"

@implementation CARArtist (CARHelpers)

+ (NSString *)entityName {
    return NSStringFromClass([self class]);
}

+ (instancetype)insertNewObjectInContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

@end
