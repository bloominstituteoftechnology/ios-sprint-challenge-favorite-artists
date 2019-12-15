//
//  GIPArtistTest.m
//  Favorite-ArtistsTests
//
//  Created by Gi Pyo Kim on 12/13/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GIPFileHelper.h"
#import "GIPArtist.h"
#import "GIPArtist+NSJSONSerialization.h"

@interface GIPArtistTest : XCTestCase

@end

@implementation GIPArtistTest

- (void)testParseArtistJSON {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSData *data = loadFile(@"MacklemoreTest.json", bundle);
    
    XCTAssertNotNil(data);
    
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error) {
        XCTFail(@"Error: %@", error);
    }
    
    NSLog(@"Artist: %@", json);
    
    NSArray *results = json[@"artists"];
    NSDictionary *result = results[0];
    
    GIPArtist *artist = [[GIPArtist alloc] initWithDictionary:result];
//initWithName:result[@"strArtist"] biography:result[@"strBiographyEN"] yearFormed:year];
    
    
    XCTAssertNotNil(artist.name);
    XCTAssertNotNil(artist.biography);
    XCTAssertEqual(1999, artist.yearFormed);
}

@end
