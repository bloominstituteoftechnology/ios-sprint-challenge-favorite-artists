//
//  REPArtist+REPConvenience.m
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPArtist+REPConvenience.h"


@implementation REPArtist (REPConvenience)

- (instancetype)initWithArtistNamed:(NSString *)name yearFormed:(int)yearFormed mood:(NSString *)mood genre:(NSString *)genre bio:(NSString *)bio onContext:(NSManagedObjectContext *)context {
	if (self = [super initWithContext:context]) {
		self.name = name;
		self.yearFormed = yearFormed;
		self.mood = mood;
		self.genre = genre;
		self.bio = bio;
	}
	return self;
}

+ (REPArtist *)artistNamed:(NSString *)name yearFormed:(int)yearFormed mood:(NSString *)mood genre:(NSString *)genre bio:(NSString *)bio onContext:(NSManagedObjectContext *)context {
	return [[REPArtist alloc] initWithArtistNamed:name yearFormed:yearFormed mood:mood genre:genre bio:bio onContext:context];
}

@end
