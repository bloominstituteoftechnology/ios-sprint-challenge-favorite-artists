//
//  REPArtist+REPConvenience.h
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REPArtist+CoreDataClass.h"

@interface REPArtist (REPConvenience)

- (instancetype)initWithArtistNamed:(NSString *)name yearFormed:(NSString *)yearFormed withID:(NSString *)artistID mood:(NSString *)mood genre:(NSString *)genre bio:(NSString *)bio onContext:(NSManagedObjectContext *)context;

+ (REPArtist *)artistNamed:(NSString *)name yearFormed:(NSString *)yearFormed withID:(NSString *)artistID mood:(NSString *)mood genre:(NSString *)genre bio:(NSString *)bio onContext:(NSManagedObjectContext *)context;

@end

