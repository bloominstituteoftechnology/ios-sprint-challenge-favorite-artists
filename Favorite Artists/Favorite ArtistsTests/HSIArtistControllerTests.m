//
//  Favorite_ArtistsTests.m
//  Favorite ArtistsTests
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HSIArtistController.h"
#import "HSIArtist+NSJSONSerialization.h"

@interface HSIArtistControllerTests : XCTestCase

@end

@implementation HSIArtistControllerTests



- (void) testFetchingArtists {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Wait for API"];
    HSIArtistController *controller = [[HSIArtistController alloc] init];

    [controller findArtistWithName:@"Elton John" completion:^(HSIArtist *artist) {
        XCTAssertNotNil(artist);
        [expectation fulfill];
    }];

    NSArray *expectationArray = [[NSArray alloc] initWithObjects:expectation, nil];
    [self waitForExpectations:expectationArray timeout:5.0];

}

#warning "If you run this, it will save an artist to the app called "Test Artist. Delete" and there is no delete method"
- (void) testSavingAndLoadingArtist {
    HSIArtistController *controller = [[HSIArtistController alloc] init];
    HSIArtist *artist = [[HSIArtist alloc] initWithName:@"Test Artist. Delete" biography:@"I'm nobody" year:9999];

    [controller addArtist:artist];
    [controller saveArtists];
    XCTAssertNotEqual([controller loadArtists].count, 0);
}

@end
