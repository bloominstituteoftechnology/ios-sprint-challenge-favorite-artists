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

- (MTGArtist *)loadArtist:(NSString *)filename {
    
    // Load test object from file.
    NSData *artistData = loadFile(filename, [MTGArtist class]);
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

    return artist;
}

- (void)testJohnWilliams {
    NSString *filename = @"John Williams.json";
    MTGArtist *artist = [self loadArtist:filename];

    NSLog(@"artist: %@", artist);

    XCTAssertEqualObjects(@"John Williams", artist.artist);
// FIXME: Starts with?
//    XCTAssertEqualObjects(@"John Towner Williams (born February 8, 1932) is an American composer", artist.biography);
    XCTAssertEqual(-1, artist.formedYear);
}

- (void)testPinkFloyd {

//    MTGArtist *artist = loadArtist(@"Pink Floyd.json");

    NSString *filename = @"Pink Floyd.json";
    MTGArtist *artist = [self loadArtist:filename];

    NSLog(@"artist: %@", artist);

    XCTAssertEqualObjects(@"Pink Floyd", artist.artist);
// FIXME: Starts with?
//    XCTAssertEqualObjects(@"Pink Floyd were an English rock band that achieved international success with their progressive and psychedelic rock music marked by the use of philosophical lyrics", artist.biography);
    XCTAssertEqual(1965, artist.formedYear);
}

- (void)testZero7 {

    NSString *filename = @"Zero 7.json";
    MTGArtist *artist = [self loadArtist:filename];

    NSLog(@"artist: %@", artist);

    XCTAssertEqualObjects(@"Zero 7", artist.artist);
// FIXME: Starts with?
//    XCTAssertEqualObjects(@"Zero 7 is a British musical duo consisting of Henry Binns and Sam Hardaker.", artist.biography);
    XCTAssertEqual(1997, artist.formedYear);
}
@end
