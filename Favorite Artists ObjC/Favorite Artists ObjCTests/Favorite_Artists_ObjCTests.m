//
//  Favorite_Artists_ObjCTests.m
//  Favorite Artists ObjCTests
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "REPArtistNetController.h"
#import "REPArtist+NSJSONSerialization.h"
#import "REPArtist+REPConvenience.h"
#import "REPCoreDataStack.h"

@interface Favorite_Artists_ObjCTests : XCTestCase

@end

@implementation Favorite_Artists_ObjCTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (NSData *)getGoodData {
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	NSData *data = loadFile(@"ArtistResults.json", bundle);

	return data;
}

- (void)testData {
	NSData* data = [self getGoodData];

	XCTAssertNotNil(data);
}

- (void)testArtistDecode {
	NSData* data = [self getGoodData];

//	REPArtistNetController* netController = [[REPArtistNetController alloc] init];
//	[netController fetchArtistNamed:@"weezer" completionBlock:^(REPArtist *artist, NSError *error) {
//
//	}];

	NSError* error;
	NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	NSManagedObjectContext* context = [[REPCoreDataStack sharedInstance].container newBackgroundContext];

	REPArtist *artist = [REPArtist artistWithDictionary:jsonDict onContext: context];

	XCTAssertEqualObjects(@"Weezer", artist.name);
}

@end
