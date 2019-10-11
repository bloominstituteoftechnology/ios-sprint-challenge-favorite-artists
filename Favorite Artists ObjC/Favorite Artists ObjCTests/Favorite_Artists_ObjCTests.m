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

	NSError* error;
	NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	NSArray *artistResults = jsonDict[@"artists"];
	NSDictionary *firstArtist = [artistResults firstObject];
	XCTAssertNotNil(firstArtist);

	NSManagedObjectContext* context = [[REPCoreDataStack sharedInstance].container newBackgroundContext];

	REPArtist *artist = [REPArtist artistWithDictionary:firstArtist onContext: context];

	XCTAssertEqualObjects(@"Weezer", artist.name);
	XCTAssertEqualObjects(@"Alternative Rock", artist.genre);
	XCTAssertEqual(1992, artist.yearFormed);
	XCTAssertEqualObjects(@"Moody", artist.mood);
	XCTAssertEqualObjects(@"Since coming together in Los Angeles in 1992, the members of Weezer have lived an especially capricious existence: In the course of a decade, they went from dorky alt-rock heroes to absentee cult figures to arena-filling megastars. The band's original lineup — lead singer and songwriter Rivers Cuomo, bassist Matt Sharp, drummer Patrick Wilson and guitarist Brian Bell — looked uncomfortable from the get-go, posing for the cover of their 1994 self-titled debut as though they were waiting to be noogied. Few might have predicted that, a decade and a half on, the band would prove consummate rock & roll pros.\nProduced by ex-Cars frontman Ric Ocasek, Weezer (Number 16, 1994), more commonly known as the Blue Album, largely eschewed grunge's angst-y, soul-baring angst howl. Cuomo didn't profess the cynicism of Kurt Cobain, and the unapologetic riffs made it clear that he was more influenced by the likes of Heaven Tonight than Raw Power. Songs like \"Undone - The Sweater Song\" (Number 57, 1994) sounded like handwritten notes found at the bottom of a locker — the early musings of a colossally self-aware nerd. The album's best-known early song, \"Buddy Holly\" (Number Two Modern Rock, 1994) mated Spike Jonze's nostalgia-tripping, \"Happy Days\"-based video with an equally nostalgic and chimerical young-and-in-love chorus: \"Wooh-e-oooh, I like just like Buddy Holly/Oh-oh, and you're Mary Tyler Moore.\" Weezer would sell more than 3 million copies, and a 2004 reissued edition includes several worthy B-sides.\nCuomo had originally intended for Weezer's follow-up to be a sci-fi rock opera called Songs from the Black Hole, but after recording a series of tracks by himself, he shelved the project in favor of Pinkerton (Number 19, 1996). Though it's since become a fan favorite and a bellwether for he late-Nineties emo boom, Pinkerton was initially seen as a downer: Cuomo had undergone a painful leg operation after the Blue Album, and the new LP was packed with brutally honest songs about falling in love with lesbians and teenage fans living oceans away; the opening track, tellingly, was \"Tired of Sex,\" and songs like \"El Scorcho\" (Number 19 Modern Rock, 1996), and \"The Good Life\" (Number 32 Modern Rock, 1996) were rife with frustration. The album takes its name from a character in Madame Butterfly, and the record is peppered with references to the opera.\nAfter a tour in support of the album — which failed to reach platinum — Sharp left the band to spend more time with his new-wave-reviving side project, the Rentals, while Cuomo dropped out of view altogether, prompting rumors that he had begun a Brian Wilson-like retreat from society (Cuomo left Harvard but returned again, earning his English degree in June 2006). Between 1997 and 2000, the band released only a handful of songs, including a cover of \"Velouria\" for a Pixies tribute album. But the band retained an ardent following on the Internet, as evidenced by the numerous threads about Pinkerton, which was quickly becoming a cult favorite.\nIn 2000, the band reformed for a string of shows on the Warped Tour, where Sharp was replaced by bassist Mikey Welsh, a former member of Juliana Hatfield's backing band. The live dates were a success, prompting a sold-out mini-tour and a new album, titled Weezer (2001), which debuted at Number Four on the Billboard charts and retuned the band to its power-chord grandeur. With Ocasek returning as producer, the so-called \"Green album\" gave the band two of the biggest hits of its career: \"Hash Pipe\" (Number Two Modern Rock), and \"Island in the Sun\" (Number 11 Modern Rock), a lulling ballad that later wound up being covered for a tropical-resort ad. A few months after the Green Album's release, Welsh experienced a psychotic breakdown, and was replaced by bassist Scott Shriner.\nAlmost exactly a year after the release of the Green Album, Weezer delivered Maladroit (Number Three, 2002). Due in part to Cuomo's abundant songwriting output, many of the self-financed Maladroit tracks had already appeared in demo form on the band's Website, and the songs' early release spurred a public battle between the band and its label, Interscope Records. But neither the controversy — nor the inclusion of singles \"Dope Nose\" (Number Eight Modern Rock) and \"Keep Fishin'\" (Number 15 Modern Rock) — could prevent Maladroit, an album that paid homage to several of Cuomo's metal influences, from failing commercially.\nWeezer teamed with Rick Rubin for 2005's Make Believe (Number Two), an album that gave the band its biggest single to date: \"Beverly Hills\" (Number 10, 2005) a sarcastic anti-fame rant that was misinterpreted by some as an ode to luxury branding. Longtime fans lamented that the Weezer responsible for Pinkerton was long gone, but \"Beverly Hills\" and the piano-plunking anthem \"Perfect Situation\" (Number 51, 2006) helped Make Believe sell more than a million copies in the U.S., and prompted an arena tour with the Foo Fighters.\nIn 2007, Cuomo released Alone: The Home Recordings of Rivers Cuomo (Number 163), a collection of demos that included songs originally intended for the long-jettisoned Songs from the Black Hole. Weezer's sixth album, once again produced by Rick Rubin — and once again titled Weezer — was released June 3rd, 2008 and hit Number Four in Billboard. The Red Album, as it's known, spawned the single \"Pork and Beans\" (Number 64, 2008), boosted by a clever video featuring numerous fly-by-night YouTube stars.\nThe band toured with Blink-182 in 2009, and the album Raditude (Number Seven) — featuring collaborations with r&b/hip-hop producer Jermaine Dupri, teen-pop songwriter Dr. Luke, and rapper Lil Wayne — followed. But the single, \"(If You're Wondering If I Want You To) I Want You To\", peaked at only Number 81 on the Billboard Hot 100. At the end of 2009, reports surfaced that the band had split with Geffen Records.", artist.bio);
}

@end
