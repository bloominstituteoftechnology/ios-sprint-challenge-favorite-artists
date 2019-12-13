//
//  Favorite_Artists_STTests.m
//  Favorite-Artists-STTests
//
//  Created by Jake Connerly on 11/8/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JLCArtist.h"
#import "JLCFileLoader.h"

@interface Favorite_Artists_STTests : XCTestCase

- (void)searchForArtistWithArtistName:(NSString *)artistName
                           completion:(void (^)(NSURL *artistURL, NSError *error))completion;

- (void)fullSearchForArtistWithArtistName:(NSString *)artistName
                               completion:(void (^)(JLCArtist *artist, NSError * error))completion;

@end

@implementation Favorite_Artists_STTests


- (void)testParsingJson {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSData *data = loadFile(@"Artist.json", bundle);
    
    XCTAssertNotNil(data);
    
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error) {
        XCTFail(@"Error: %@", error);
    }
    
    NSLog(@"Artist: %@", json);
    
    JLCArtist *bush = [[JLCArtist alloc] InitWithDictionary:json];
    
    XCTAssertEqualObjects(@"Bush", bush.artistName);
    XCTAssertEqualObjects(@"1991", bush.yearFormed);
    
    NSString *bio = @"Bush are an alternative rock band formed in London in 1992 shortly after vocalist/guitarist Gavin Rossdale and guitarist Nigel Pulsford met. It was not long before they recruited bassist Dave Parsons, and later drummer Robin Goodridge, and started writing. Dave Parsons joined Bush shortly after leaving the band Transvision Vamp. Drummers such as Sacha Gervasi, Amir, and Spencer Cobrin had all filled in as Bush drummers before Robin Goodridge was made the permanent fit and thus completing the Bush lineup.\n\nThe band found immediate success with the release of their debut album Sixteen Stone in 1994, which is certified 6Ã— multi-platinum by the RIAA. Bush went on to become one of the most commercially successful rock bands of the 1990s, selling over 10 million records in the United States. Despite their success in the United States, the band was less well known in their home country and enjoyed only marginal success there. Bush have had numerous top ten singles on the Billboard rock charts, and one No. 1 album for Razorblade Suitcase in 1996. The band separated in 2002 but the name was revived in 2010 and they began work on a new album, The Sea of Memories, which was released in September 2011.\n\nThe group chose the name \"Bush\" because they used to live in Shepherd's Bush, London.\n\nIn Canada, they were once known as Bushx, because the 1970s band Bush, led by Domenic Troiano, owned the Canadian rights to the name. In April 1997, it was announced that Troiano had agreed to let them use the name Bush in Canada without the exponent x, in exchange for donating $20,000 each to the Starlight Children's Foundation and the Canadian Music Therapy Trust Fund.";
    
    XCTAssertEqualObjects(bio, bush.biography);
    
}

static NSString *const baseURLString = @"https://theaudiodb.com/api/v1/json/1/search.php";

- (void)searchForArtistWithArtistName:(NSString *)artistName completion:(void (^)(NSURL *artistURL, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *artistToSearch = [NSURLQueryItem queryItemWithName:@"s" value:artistName];
    [components setQueryItems:@[artistToSearch]];
    
    NSURL *url = [components URL];
    NSLog(@"url: %@", url);
    
    completion(url, nil);
}

-(void)testURLFormation {
    
    NSURL *expectedURL = [NSURL URLWithString:@"https://theaudiodb.com/api/v1/json/1/search.php?s=Bush"];
    
    [self searchForArtistWithArtistName:@"Bush" completion:^(NSURL *artistURL, NSError *error) {
        if (error) {
            XCTFail(@"Error: %@", error);
        }
        
        NSLog(@"EXPECTED URL: %@\n", expectedURL);
        NSLog(@"Artist URL: %@", artistURL);
        XCTAssertEqualObjects(expectedURL, artistURL);
    }];
}

- (void)fullSearchForArtistWithArtistName:(NSString *)artistName completion:(void (^)(JLCArtist *artist, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *artistToSearch = [NSURLQueryItem queryItemWithName:@"s" value:artistName];
    [components setQueryItems:@[artistToSearch]];
    
    NSURL *url = [components URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request
                                                               completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (!data) {
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, error);
            return;
        }
        
        if(![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a top lvel dictionary as expected");
            completion(nil, [[NSError alloc] init]);
        }
        
        NSArray *artistsResults = json[@"artists"];
        NSDictionary *artistDictionary = artistsResults[0];
        JLCArtist *artist = [[JLCArtist alloc] InitWithDictionary:artistDictionary];
        
        completion(artist, nil);
    }];
    [task resume];
}
    
- (void)testFullArtistSearch {
    [self fullSearchForArtistWithArtistName:@"Bush" completion:^(JLCArtist *artist, NSError *error) {
        if (error) {
            XCTFail(@"Error: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            XCTAssertEqualObjects(@"Bush", artist.artistName);
            XCTAssertEqualObjects(@"1991", artist.yearFormed);
        });
    }];
}


@end
