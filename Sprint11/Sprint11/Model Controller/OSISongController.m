//
//  OSISongController.m
//  Sprint11
//
//  Created by Sergey Osipyan on 3/1/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSISongController.h"
#import "OSISong.h"

@implementation OSISongController

- (instancetype)init {
    self = [super init];
    if (self) {
        _songs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createSong:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating {
    
    
}

- (void)searchForSong:(NSString *)artist trackName:(NSString *)trackName completion:(void (^)(NSDictionary * _Nonnull, NSError * _Nonnull))completion {
    
    
    
}

@end
