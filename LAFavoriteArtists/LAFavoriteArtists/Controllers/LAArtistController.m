//
//  LAArtistController.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//


#import "LAArtistController.h"

@interface LAArtistController() {
    
}

@property(nonatomic, readwrite) NSMutableArray *internalArtists;

@end

@implementation LAArtistController

-(instancetype)init {
    self = [super init];
    if (self){
        _internalArtists = [[NSMutableArray alloc]init];
    }
    return self;
}



- (void)addArtist:(LAArtist *)artist {
    [self.internalArtists addObject: artist];
}

-(NSArray *)artists {
    return self.internalArtists; //_internalArtists
}

@end
