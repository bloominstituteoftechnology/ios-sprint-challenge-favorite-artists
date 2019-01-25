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

// Computed property?
-(NSArray *)songs {
    return self.songArray;
}



@end
