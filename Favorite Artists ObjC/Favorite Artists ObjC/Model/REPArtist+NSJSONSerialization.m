//
//  REPArtist+NSJSONSerialization.m
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPArtist+NSJSONSerialization.h"
#import "REPArtist+REPConvenience.h"


@implementation REPArtist (NSJSONSerialization)

+ (REPArtist *)artistWithDictionary:(NSDictionary *)dictionary onContext:(NSManagedObjectContext *)context {

	NSString *name = dictionary[@"strArtist"];
	NSString *bio = dictionary[@"strBiographyEN"];
	NSString *mood = dictionary[@"strMood"];
	NSString *genre = dictionary[@"strGenre"];
	NSNumber *yearFormedNumber = dictionary[@"intFormedYear"];

	if (name != nil &&
		yearFormedNumber != nil// &&
		) {
		int yearFormed = [yearFormedNumber intValue];

		return [REPArtist artistNamed:name yearFormed:yearFormed mood:mood genre:genre bio:bio onContext:context];
	} else {
		return nil;
	}
}

- (NSDictionary *)dictionary {
	return nil;
}

@end
