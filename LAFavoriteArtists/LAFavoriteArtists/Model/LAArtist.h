//
//  LAArtist.h
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LAArtist : NSObject

//init from dictionary



//properties
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *biography;
@property () int year;

@end

NS_ASSUME_NONNULL_END
