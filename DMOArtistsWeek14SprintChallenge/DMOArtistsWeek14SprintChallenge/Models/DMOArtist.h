//
//  DMOArtist.h
//  DMOArtistsWeek14SprintChallenge
//
//  Created by morse on 1/24/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMOArtist : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) int year;
@property (nonatomic, copy)NSString *about;

- (instancetype)initWithName:(NSString *)name
                        year:(int)year
                       about:(NSString *)about;

@end
