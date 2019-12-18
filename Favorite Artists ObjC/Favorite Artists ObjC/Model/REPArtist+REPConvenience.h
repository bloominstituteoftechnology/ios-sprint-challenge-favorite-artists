//
//  REPArtist+REPConvenience.h
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPArtist+CoreDataClass.h"


@interface REPArtist (REPConvenience)
+ (REPArtist *)artistNamed:(NSString *)name yearFormed:(int)yearFormed mood:(NSString *)mood genre:(NSString *)genre bio:(NSString *)bio onContext:(NSManagedObjectContext *)context;

- (instancetype)initWithArtistNamed:(NSString *)name yearFormed:(int)yearFormed mood:(NSString *)mood genre:(NSString *)genre bio:(NSString *)bio onContext:(NSManagedObjectContext *)context;


@end

