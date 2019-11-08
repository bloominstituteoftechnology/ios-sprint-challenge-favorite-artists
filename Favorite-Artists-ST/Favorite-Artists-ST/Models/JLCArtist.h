//
//  JLCArtist.h
//  Favorite-Artists-ST
//
//  Created by Jake Connerly on 11/8/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLCArtist : NSObject

@property NSString *artistName;
@property NSString *yearFormed;
@property NSString *biography;

- (instancetype)initWithName:(NSString *)artistName
                  yearFormed:(NSString *)yearFormed
                   biography:(NSString *)biography;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

