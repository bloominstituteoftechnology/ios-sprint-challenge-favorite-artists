//
//  Artist.h
//  Favorite Artists
//
//  Created by Michael Stoffer on 11/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject

- (instancetype)initWithArtistName:(NSString *)artist biography:(NSString *)biography formed:(int)formed;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic) int yearFormed;

@end
