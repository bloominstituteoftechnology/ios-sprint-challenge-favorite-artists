//
//  JSArtist.h
//  Artistree
//
//  Created by Jeffrey Santana on 10/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSArtist : NSObject

@property NSString *name;
@property NSString *biography;
@property int yearFormed;

- (instancetype)initWithDict:(NSDictionary *)artistDict;

@end

NS_ASSUME_NONNULL_END
