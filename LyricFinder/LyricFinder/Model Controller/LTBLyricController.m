//
//  LTBLyricController.m
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBLyricController.h"
#import "LTBLyric+Convenience.h"
#import "LTBCoreDataStack.h"

@interface LTBLyricController ()

@property (nonatomic) NSMutableArray *lyrics;

@end

@implementation LTBLyricController

- (instancetype)init
{
    if (self = [super init]) {
        _lyrics = [[NSMutableArray alloc] init];   //WithArray:[self loadFromCoreData]];
    }
    return self;
}

- (NSArray<LTBLyric *> *)lyrics
{
    return [self.lyrics copy];
}

- (void)createLyricWithTitle:(NSString *)title artist:(NSString *)artist
{
    
}

- (void)updateLyric:(LTBLyric *)lyric title:(NSString *)title artist:(NSString *)artist
{

}

- (void)loadLyricsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(LTBLyric *lyrics, NSError *error))completion
{
}

                                   
@end
