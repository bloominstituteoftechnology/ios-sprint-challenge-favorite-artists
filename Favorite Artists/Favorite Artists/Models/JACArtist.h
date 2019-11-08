//
//  JACArtist.h
//  Favorite Artists
//
//  Created by Jordan Christensen on 11/9/19.
//  Copyright © 2019 Mazjap Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JACArtist : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic) int yearFormed;
@property (nonatomic, copy) NSString *desc;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
