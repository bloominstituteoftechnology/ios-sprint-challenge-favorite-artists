//
//  REPArtist+NSJSONSerialization.h
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPArtist+CoreDataClass.h"


@interface REPArtist (NSJSONSerialization)

@property (readonly) NSDictionary* dictionary;

+ (REPArtist *)artistWithDictionary:(NSDictionary *)dictionary onContext:(NSManagedObjectContext *)context;

@end

