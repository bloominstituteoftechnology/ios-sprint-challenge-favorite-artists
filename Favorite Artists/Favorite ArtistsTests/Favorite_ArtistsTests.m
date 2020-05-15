//
//  Favorite_ArtistsTests.m
//  Favorite ArtistsTests
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "MTGArtist.h"
#import "MTGArtist+NSJSONSerialization.h"

@interface Favorite_ArtistsTests : XCTestCase

@end

@implementation Favorite_ArtistsTests

- (void)testMacklemore {

    // Load test object from file.
    NSData *artistData = loadFile(@"Macklemore.json", [MTGArtist class]);
    NSLog(@"artistData: %@", artistData);

    // Pass through JSON Serializer
    NSError *jsonError = nil;
    NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData
                                                                     options:0
                                                                       error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON Parsing error: %@", jsonError);
    }

    NSLog(@"JSON: %@", artistDictionary);

    // Parse the dictionary and turn it into a CurrentWeather object

    // Pass it through MTGArtist initializer
    MTGArtist *artist = [MTGArtist initWithDictionary:artistDictionary];

    NSLog(@"artist: %@", artist);

    XCTAssertEqualObjects(@"Macklemore", artist.artist);
// FIXME: Starts with?
//    XCTAssertEqualObjects(@"Ben Haggerty (born June 19, 1983)", artist.biography);
    XCTAssertEqual(1999, artist.formedYear);
}

@end
