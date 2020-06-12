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
 NSData *data = loadFile(@"Artist.json",bundle);
 XCTAssertNotNil(data);
 NSError *error = nil;
 NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
 CNSArtistModel *artist = [[CNSArtistModel alloc] initWithDictionary:json];
 XCTAssertEqualObjects(@"Coldplay", artist.artistName);
}
@end
