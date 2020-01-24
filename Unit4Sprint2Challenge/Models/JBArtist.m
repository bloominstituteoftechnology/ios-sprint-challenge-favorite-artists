//
//  JBArtist.m
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import "JBArtist.h"


@interface JBArtist ()

@property (nonatomic, readonly) NSNumber *yearFormed;
@property (nonatomic, readonly) NSNumber *yearBorn;

@end

@implementation JBArtist

- (instancetype) initWithName:(NSString *)name
                    biography:(NSString *)biography
                   originYear:(int)originYear
                      wasBorn:(BOOL)wasBorn
{
    self = [super init];
    if (self)
    {
        _name = name;
        _biography = biography;
        NSNumber *originAsNum = [NSNumber numberWithInt:originYear];
        if (wasBorn)
        {
            _yearBorn = originAsNum;
        }
        else
        {
            _yearFormed = originAsNum;
        }
    }
    return self;
}

- (int)originYear
{
    NSNumber *originAsNum = (self.yearFormed == nil) ? self.yearBorn : self.yearFormed;
    return originAsNum.intValue;
}

- (BOOL)wasBorn
{
    return (self.yearFormed == nil);
}

@end
