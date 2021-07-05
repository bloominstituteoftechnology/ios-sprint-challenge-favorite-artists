//
//  LSCSongController.m
//  ios-sprint-11
//
//  Created by David Doswell on 10/5/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

#import "LSCSongController.h"
#import "LSCSong.h"

@implementation LSCSongController
- (instancetype)init
{
    self = [super init];
    if (self) {
        // initialize an empty array
        NSString *song = [NSString stringWithFormat:@""];
        NSMutableArray *songs = [[NSMutableArray alloc] init];
        [songs addObject:song];
    }
    return self;
}

@end
