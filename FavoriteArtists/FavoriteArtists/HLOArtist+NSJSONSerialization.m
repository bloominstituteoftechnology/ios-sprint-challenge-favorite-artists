//
//  Artist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import "HLOArtist+NSJSONSerialization.h"

@implementation HLOArtist (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
    // Containers
    NSArray *artistsContainer = dictionary[@"artists"];
    NSDictionary *artistResultDict = artistsContainer[0];

    // Properties
    NSString *artistName = artistResultDict[@"strArtist"];
    if([artistName isKindOfClass:[NSNull class]]) { artistName = @"Artist Name not Found"; }

    NSString *artistBiography = artistResultDict[@"strBiographyEN"];
    if([artistBiography isKindOfClass:[NSNull class]]) { artistBiography = @"Artist Biography not found"; }

    // MARK:- Why the hell did they name it intYearFormed when it returns a String ??????????????????
    NSString *yearFormedString = artistResultDict[@"intFormedYear"];
    if([yearFormedString isKindOfClass:[NSNull class]]) { yearFormedString = nil; }

    // If year is nil return 1 (which we'll use to check for what string to print)
    self = [[HLOArtist alloc] initWithName:artistName artistBiography:artistBiography yearFormed:yearFormedString == nil ? 1 : yearFormedString.intValue];
    return self;
}

/// Turns the Artist Object into the same nested format of Dictionary{Array[Dictionary]} returned from API
- (NSDictionary *)toDictionary {
    // Mutable dictionary initializers
    NSMutableDictionary *dictionaryContainer = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];

    //Customize
    [dictionary setValue:self.artistName forKey:@"strArtist"];
    [dictionary setValue:self.artistBiography forKey:@"strBiographyEN"];
    NSString *yearFormed = [NSString stringWithFormat:@"%d", self.yearFormed];
    [dictionary setValue:yearFormed forKey:@"intYearFormed"];

    // Create an array containeras done in the dictionary passed from the API so that the initFromDictionary will work whether data is loaded from API or persistence. (Let's hope this works)
    NSArray *artistsContainer = [[NSArray alloc] initWithObjects:dictionary, nil];

    [dictionaryContainer setValue:artistsContainer forKey:@"artists"];

    return dictionaryContainer;
}

- (void)saveToPersistence {
    NSURL *documentsDirectory = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;

    NSURL *saveFileURL = [documentsDirectory URLByAppendingPathComponent:self.artistName];

    NSDictionary *dictRepresentation = self.toDictionary;

    NSError *saveError = nil;
    [dictRepresentation writeToURL:saveFileURL error:&saveError];
}
@end
