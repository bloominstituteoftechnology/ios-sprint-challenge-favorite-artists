//
//  SAEArtist.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 12/1/20.
//

#import "SAEArtist.h"

@implementation SAEArtist

- (instancetype)initWithArtistName:(NSString *)aName
                         biography:(NSString *)aBiography
                        formedYear:(int)aYear
{
    if (self = [super init]) {
        _artistName = aName.copy;
        _biography = aBiography.copy;
        _formedYear = aYear;
    }
    return self;
}

@end
