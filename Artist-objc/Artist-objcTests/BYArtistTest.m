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
#import "BYArtistController.h"

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

- (void)testSaveAndLoadArtists {
    NSBundle *bundle  = [NSBundle bundleForClass:[self class]];
    NSData *data = loadFile(@"Artists.json", bundle);
    XCTAssertNotNil(data);
    
    NSError *error = nil;
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSLog(@"Error: %@", error);
    NSLog(@"JSON: %@", json);
    BYArtistController *controller = [[BYArtistController alloc] init];
    BYArtist *artist = [[BYArtist alloc] initWithDictionary:json];
    XCTAssertEqualObjects(@"Coldplay", artist.name);
    XCTAssertEqual(1996, artist.year);
    
    [controller addArtist:artist];
    BYArtist *artist1 = [controller.artists firstObject];
    XCTAssertEqualObjects(@"Coldplay", artist1.name);
    
    [controller.artists removeAllObjects];
    XCTAssertTrue([controller.artists count] == 0);
    [controller loadArtists];
    BYArtist *artist2 = [controller.artists firstObject];
    XCTAssertEqualObjects(@"Coldplay", artist2.name);
}

@end
