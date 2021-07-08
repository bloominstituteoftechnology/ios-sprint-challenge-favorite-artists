//
//  JWSongController.m
//  JWLyricFinder
//
//  Created by Jerrick Warren on 1/25/19.
//  Copyright © 2019 Jerrick Warren. All rights reserved.
//

#import "JWSongController.h"

// import interface from m. File
@interface JWSongController()

@property (nonatomic, copy) NSMutableArray *songArray;

@end

@implementation JWSongController

-(instancetype)init {
    
    self = [super init];
    if (self){
        _songArray = [@[] mutableCopy];
    }
   return self;

}

-(void)addSongWithTitle:(NSString *)title
             artistName:(NSString *)artistName
                 lyrics:(NSString *)lyrics
                 rating:(NSInteger *)rating; {
    
}


-(void)searchLyrics:(NSString *)title
         artistName:(NSString *)artistName
         completion: (void (^)(NSString * _Nullable lyrics, NSError * _Nullable error))completion; {


}

// Computed property?
-(NSArray *)songs {
    return self.songArray;
}


// base url Strings (static)

static NSString * const baseURLString = @""; // not working.
static NSString * const APIKey = @""; // not working smh

@end
