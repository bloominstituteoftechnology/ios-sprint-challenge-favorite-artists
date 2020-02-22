//
//  BFVArtist+Convenience.m
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "BFVArtist+Convenience.h"
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BFVArtist+CoreDataClass.h"
#import "BFVCoreDataStack.h"

@implementation BFVArtist (Convenience)

- (instancetype)initWithBandName:(NSString *)bandName yearFormed:(int_fast64_t)yearFormed biography:(NSString *)biography context:(NSManagedObjectContext *)context {
    self = [self initWithContext:context];
    if (self) {
        self.bandName = [bandName copy];
        self.biography = [biography copy];
        self.yearFormed = yearFormed;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *bandName = dictionary[@"strArtist"];
      int yearFormed = [dictionary[@"intFormedYear"] intValue]  ;
      NSString *biography = dictionary[@"strBiographyEN"];
    return [self initWithBandName:bandName yearFormed:yearFormed biography:biography context: BFVCoreDataStack.shared.mainContext];
}

@end
