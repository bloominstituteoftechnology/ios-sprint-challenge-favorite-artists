//
//  LSITests.m
//  LSITests
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIArtist.h"
#import "LSIFileHelper.h"

@interface LSITests : XCTestCase

@end

@implementation LSITests


-(void)testParseArtistJSON {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
     NSData *data = loadFile(@"Artist.json",bundle);
     XCTAssertNotNil(data);
     NSError *error = nil;
     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
     LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:json];
     XCTAssertEqualObjects(@"Coldplay", artist.artistName);
}

@end
