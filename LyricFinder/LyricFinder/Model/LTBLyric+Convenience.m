//
//  LTBLyric+Convenience.m
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBLyric+Convenience.h"
#import "LTBCoreDataStack.h"

@implementation LTBLyric (Convenience)

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics
{
    return [self initWithTitle:title artist:artist lyrics:lyrics rating:0];
}

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating
{
    return [self initWithTitle:title artist:artist lyrics:lyrics rating:rating managedObjectContext:LTBCoreDataStack.sharedStack.mainContext];
}

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating managedObjectContext:(NSManagedObjectContext *)moc
{
    if (self = [self initWithContext:moc]) {
        self.title = title;
        self.artist = artist;
        self.lyric = lyrics;
        self.rating = rating;
    }
    return self;
}


@end
