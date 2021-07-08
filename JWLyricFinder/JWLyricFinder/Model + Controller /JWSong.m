//
//  JWSong.m
//  JWLyricFinder
//
//  Created by Jerrick Warren on 1/25/19.
//  Copyright © 2019 Jerrick Warren. All rights reserved.
//

#import "JWSong.h"

@implementation JWSong

-(instancetype)initWithTitle:(NSString *)title
                  artistName:(NSString *)artistName
                      lyrics:(NSString *)lyrics
                      rating:(NSInteger *)rating {
    
    self = [super init];
    if (self) { // JWSong
    
        _title = [title copy];
        _artistName = [artistName copy];
        _lyrics = [lyrics copy];
        _rating = rating; // no copy here
}
    return self;
}

-(void)addSongWithTitle:(NSString *)title
             artistName:(NSString *)artistName
                 lyrics:(NSString *)lyrics
                 rating:(NSInteger *)rating; {
    
    
    
}

@end

