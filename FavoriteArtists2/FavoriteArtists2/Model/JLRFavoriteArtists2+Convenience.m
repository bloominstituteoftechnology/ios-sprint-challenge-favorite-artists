//
//  JLRFavoriteArtists2+Convenience.m
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLRFavoriteArtists2+Convenience.h"
#import <CoreData/CoreData.h>

@implementation Artist (Convenience)

- (instancetype)initWithName:(NSString *)name bio:(NSString *)bio formed:(NSDate *)formed context:(NSManagedObjectContext *)context
{
    self = [self initWithContext:context];
    if (self) {
        self.name = [name copy];
        self.bio = [bio copy];
        self.formed = [formed copy];
    }
    return self;
}

@end
