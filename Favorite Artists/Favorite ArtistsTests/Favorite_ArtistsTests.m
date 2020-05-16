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

    NSString *filename = @"Macklemore.json";
    MTGArtist *artist = [self loadArtist:filename];

    NSLog(@"artist: %@", artist);

    XCTAssertEqualObjects(@"Macklemore", artist.artist);

    // Starts with test...
    NSString *strToCompare = @"Ben Haggerty (born June 19, 1983)";
    NSString *strToTest = [artist.biography substringToIndex:[strToCompare length]];
    XCTAssertEqualObjects(strToCompare, strToTest);

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
    MTGArtist *artist = [[MTGArtist alloc] initWithDictionary:artistDictionary];

    return artist;
}

- (void)testJohnWilliams {
    NSString *filename = @"John Williams.json";
    MTGArtist *artist = [self loadArtist:filename];

    NSLog(@"artist: %@", artist);

    XCTAssertEqualObjects(@"John Williams", artist.artist);

    // Starts with test...
    NSString *strToCompare = @"John Towner Williams (born February 8, 1932) is an American composer";
    NSString *strToTest = [artist.biography substringToIndex:[strToCompare length]];
    XCTAssertEqualObjects(strToCompare, strToTest);

    XCTAssertEqual(-1, artist.formedYear);
}

- (void)testPinkFloyd {

//    MTGArtist *artist = loadArtist(@"Pink Floyd.json");

    NSString *filename = @"Pink Floyd.json";
    MTGArtist *artist = [self loadArtist:filename];

    NSLog(@"artist: %@", artist);

    XCTAssertEqualObjects(@"Pink Floyd", artist.artist);

    // Starts with test...
    NSString *strToCompare = @"Pink Floyd were an English rock band that achieved international success with their progressive and psychedelic rock music marked by the use of philosophical lyrics";
    NSString *strToTest = [artist.biography substringToIndex:[strToCompare length]];
    XCTAssertEqualObjects(strToCompare, strToTest);

    XCTAssertEqual(1965, artist.formedYear);
}

- (void)testZero7 {

    NSString *filename = @"Zero 7.json";
    MTGArtist *artist = [self loadArtist:filename];

    NSLog(@"artist: %@", artist);

    XCTAssertEqualObjects(@"Zero 7", artist.artist);

    // Starts with test...
    NSString *strToCompare = @"Zero 7 is a British musical duo consisting of Henry Binns and Sam Hardaker.";
    NSString *strToTest = [artist.biography substringToIndex:[strToCompare length]];
    XCTAssertEqualObjects(strToCompare, strToTest);

    XCTAssertEqual(1997, artist.formedYear);
}
@end
