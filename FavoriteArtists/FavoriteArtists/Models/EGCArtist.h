//
//  EGCArtist.h
//  FavoriteArtists
//
//  Created by Enrique Gongora on 4/17/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EGCArtist : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) int year;
@property (nonatomic, copy)NSString *about;

- (instancetype)initWithName:(NSString *)name
                        year:(int)year
                       about:(NSString *)about;

@end
