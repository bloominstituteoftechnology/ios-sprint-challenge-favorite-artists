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

static NSString const *nameKey = @"strArtist";
static NSString const *bioKey = @"strBiographyEN";
static NSString const *moodKey = @"strMood";
static NSString const *genreKey = @"strGenre";
static NSString const *yearFormedKey = @"intFormedYear";

+ (REPArtist *)artistWithDictionary:(NSDictionary *)dictionary onContext:(NSManagedObjectContext *)context {

	NSString *name = dictionary[nameKey];
	NSString *bio = dictionary[bioKey];
	NSString *mood = dictionary[moodKey];
	NSString *genre = dictionary[genreKey];
	NSNumber *yearFormedNumber = dictionary[yearFormedKey];
	if ([yearFormedNumber isKindOfClass:[NSNull class]]) {
		yearFormedNumber = [NSNumber numberWithInt:NAN];
	}

	if (name != nil &&
		yearFormedNumber != nil &&
		bio != nil
		) {
		int yearFormed = [yearFormedNumber intValue];

		return [REPArtist artistNamed:name yearFormed:yearFormed mood:mood genre:genre bio:bio onContext:context];
	} else {
		return nil;
	}
}

- (NSDictionary *)dictionary {
	NSDictionary *artistDict = @{
		nameKey: self.name,
		bioKey: self.bio,
		moodKey: self.mood,
		genreKey: self.genre,
		yearFormedKey: [NSNumber numberWithInt:self.yearFormed]
	};
	return artistDict;
}

@end
