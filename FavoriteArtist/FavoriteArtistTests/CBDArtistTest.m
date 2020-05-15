//
//  CBDArtistTest.m
//  FavoriteArtistTests
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CBDArtist.h"
#import "CBDArtist+NSJSONSerialization.h"
#import "LSIFileHelper.h"

@interface CBDArtistTest : XCTestCase

@end

@implementation CBDArtistTest

- (void)testArtistParsing {
    
    NSData *artistData = loadFile(@"Artist.json", [NSBundle mainBundle]);
    NSLog(@"Artist: %@", artistData);
    NSError *jsonError = nil;
    NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON Parsing error: %@", jsonError);
    }
    NSLog(@"JSON: %@", artistDictionary);
    CBDArtist *artist = [[CBDArtist alloc] initWithDictionary:artistDictionary];
    NSLog(@"Artist: %@", artist);
    XCTAssertEqualObjects(@"Coldplay", artist.strArtist);
    XCTAssertEqualObjects(@"Coldplay are a British alternative rock band formed in 1996 by lead vocalist Chris Martin and lead guitarist Jonny Buckland at University College London. After they formed Pectoralz, Guy Berryman joined the group as a bassist and they changed their name to Starfish. Will Champion joined as a drummer, backing vocalist, and multi-instrumentalist, completing the line-up. Manager Phil Harvey is often considered an unofficial fifth member. The band renamed themselves \"Coldplay\" in 1998, before recording and releasing three EPs; Safety in 1998, Brothers & Sisters as a single in 1999 and The Blue Room in the same year. The latter was their first release on a major label, after signing to Parlophone.\n\nThey achieved worldwide fame with the release of the single \"Yellow\" in 2000, followed by their debut album released in the same year, Parachutes, which was nominated for the Mercury Prize. The band's second album, A Rush of Blood to the Head (2002), was released to critical acclaim and won multiple awards, including NME's Album of the Year, and has been widely considered the best of the Nelson-produced Coldplay albums. Their next release, X&Y, the best-selling album worldwide in 2005, was met with mostly positive reviews upon its release, though some critics felt that it was inferior to its predecessor. The band's fourth studio album, Viva la Vida or Death and All His Friends (2008), was produced by Brian Eno and released again to largely favourable reviews, earning several Grammy nominations and wins at the 51st Grammy Awards. On 24 October 2011, they released their fifth studio album, Mylo Xyloto, which was met with mixed to positive reviews, and was the UK's best-selling rock album of 2011.\n\nThe band has won a number of music awards throughout their career, including seven Brit Awards winning Best British Group three times, four MTV Video Music Awards, and seven Grammy Awards from twenty nominations. As one of the world's best-selling music artists, Coldplay have sold over 55 million records worldwide. In December 2009, Rolling Stone readers voted the group the fourth best artist of the 2000s.\n\nColdplay have been an active supporter of various social and political causes, such as Oxfam's Make Trade Fair campaign and Amnesty International. The group have also performed at various charity projects such as Band Aid 20, Live 8, Sound Relief, Hope for Haiti Now: A Global Benefit for Earthquake Relief, The Secret Policeman's Ball, and the Teenage Cancer Trust.", artist.strBiographyEN);
    XCTAssertEqualWithAccuracy(1996, artist.yearFormed, 1);

    
}


@end
