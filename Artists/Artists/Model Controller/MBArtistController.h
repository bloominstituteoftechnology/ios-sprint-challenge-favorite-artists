//
//  MBArtistController.h
//  Artists
//
//  Created by Mitchell Budge on 7/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBArtistController : NSObject

@property NSMutableArray *artists;

- (void)createArtist:(MBArtist *)artist;

@end

NS_ASSUME_NONNULL_END
