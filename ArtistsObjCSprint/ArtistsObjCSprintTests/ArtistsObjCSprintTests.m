//
//  ArtistsObjCSprintTests.m
//  ArtistsObjCSprintTests
//
//  Created by Ezra Black on 6/12/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CNSArtistModel.h"
#import "CNSArtistModel+ArtistSerialization.h"

@interface ArtistsObjCSprintTests : XCTestCase

@end

@implementation ArtistsObjCSprintTests

-(void)testParsingTheArtistJSON {
NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *artistURL = [bundle URLForResource:@"Artist" withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:artistURL];
 XCTAssertNotNil(data);
 NSError *error = nil;
 NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
    
    if (!json || ![json isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Error no top level Dictionary in JSON %@", error);
    }
    NSLog(@"Disctionary: %@", json);
    
    if (json[@"artists"] == [NSNull null]) {
        NSLog(@"Error: no artists found for search term");
    }
   
 CNSArtistModel *artist = [[CNSArtistModel alloc] initWithDictionary:json];
// XCTAssertEqualObjects(artist.artistName != @"badBand");
}
@end
