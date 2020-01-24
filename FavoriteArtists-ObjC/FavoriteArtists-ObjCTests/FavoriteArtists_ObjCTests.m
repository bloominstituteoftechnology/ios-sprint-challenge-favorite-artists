//
//  FavoriteArtists_ObjCTests.m
//  FavoriteArtists-ObjCTests
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MJRArtist.h"
#import "LSIFileHelper.h"

@interface FavoriteArtists_ObjCTests : XCTestCase

@end

@implementation FavoriteArtists_ObjCTests



- (void)testExample {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSData *data = loadFile(@"Artist.json", bundle);

    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

    NSLog(@"Error: %@", error);
    NSLog(@"JSON: %@", json);

    NSArray *artists = json[@"artists"];
    MJRArtist *artist = [[MJRArtist alloc] initWithDictionary:artists[0]];
    NSLog(@"artist: %@", artist);

    XCTAssertNotNil(artist);
    XCTAssertEqualObjects(@"Coldplay", artist.artistName);
    XCTAssertEqual(1996, artist.yearFormed);
}

@end
