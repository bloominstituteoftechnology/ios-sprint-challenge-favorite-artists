//
//  JBArtist.h
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBArtist : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *biography;
@property (nonatomic, readonly) int originYear;

@property (nonatomic, readonly) NSString *originYearText;
@property (nonatomic, readonly) BOOL wasBorn;

- (instancetype) initWithName:(NSString *)name
                    biography:(NSString *)biography
                   originYear:(int)originYear
                      wasBorn:(BOOL)wasBorn;

@end
