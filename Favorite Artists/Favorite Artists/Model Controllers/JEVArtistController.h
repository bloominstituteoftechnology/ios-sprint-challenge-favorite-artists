//
//  JEVArtistController.h
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JEVArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JEVArtistController : NSObject

//MARK: Model Properties

@property NSString *name;
@property NSString *biography;
@property int yearFormed; 
@end

NS_ASSUME_NONNULL_END
