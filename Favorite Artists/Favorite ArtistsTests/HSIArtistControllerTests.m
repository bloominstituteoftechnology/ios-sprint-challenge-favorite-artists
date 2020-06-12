//
//  Favorite_ArtistsTests.m
//  Favorite ArtistsTests
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HSIArtistController.h"

@interface HSIArtistControllerTests : XCTestCase

@end

@implementation HSIArtistControllerTests

- (void) testFetchingArtists {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Wait for API"];
    HSIArtistController *controller = [[HSIArtistController alloc] init];

    [controller findArtistWithName:@"asfdsadf" completion:^(HSIArtist *artist) {
        XCTAssertNotNil(artist);
        [expectation fulfill];
    }];
    NSArray *expectationArray = [[NSArray alloc] initWithObjects:expectation, nil];
    [self waitForExpectations:expectationArray timeout:5.0];

}

@end
