//
//  HHArtist.h
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHArtist : NSObject

@property NSString *name;
@property NSString *biography;
@property int yearFormed;

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                  yearFormed:(int)yearFormed;

@end

NS_ASSUME_NONNULL_END
