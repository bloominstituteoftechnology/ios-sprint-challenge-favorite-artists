//
//  AMCArtist.h
//  FavArtist
//
//  Created by Aaron Cleveland on 3/20/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AMCArtist : NSObject

// Add init

-(instancetype)initWithArtistName:(NSString *)artist biography:(NSString *)biography formed:(int)formed;

// Add properties

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic) int yearFormed;

@end
