//
//  BYArtistTest.m
//  Artist-objcTests
//
//  Created by Bradley Yin on 10/11/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BYFileHelper.h"
#import "BYArtist.h"
#import "BYArtist+BYNSJSONSerialization.h"

@interface BYArtistTest : XCTestCase

@end

@implementation BYArtistTest

- (void)testParseArtistJson {
    NSBundle *bundle  = [NSBundle bundleForClass:[self class]];
    NSData *data = loadFile(@"Artists.json", bundle);
    XCTAssertNotNil(data);
    
    NSError *error = nil;
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSLog(@"Error: %@", error);
    NSLog(@"JSON: %@", json);
    
    BYArtist *artist = [[BYArtist alloc] initWithDictionary:json];
    
    
    
    XCTAssertEqualObjects(@"Coldplay", artist.name);
    XCTAssertEqual(1996, artist.year);
}

@end
