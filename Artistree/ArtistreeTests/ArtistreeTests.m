//
//  ArtistreeTests.m
//  ArtistreeTests
//
//  Created by Jeffrey Santana on 10/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "JSArtist.h"

@interface ArtistreeTests : XCTestCase

@end

@implementation ArtistreeTests

- (void)testParseArtistJSON {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSData *data = loadFile(@"Artist.json",bundle);
    
    XCTAssertNotNil(data);
    NSLog(@"Data; %@", data);

    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    NSLog(@"Error: %@", error);
    NSLog(@"JSON: %@", json);
	
	JSArtist *artist = [[JSArtist alloc] initWithDict: json];
	XCTAssertNotNil(artist);
	XCTAssertEqualObjects(@"Coldplay", artist.name);	
}

@end
