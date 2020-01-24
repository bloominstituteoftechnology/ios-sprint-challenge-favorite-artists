//
//  SKSArtist.h
//  unit4-sprintchallenge2-ss
//
//  Created by Lambda_School_Loaner_204 on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKSArtist : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *biography;
@property (nonatomic) int birthYear;

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography birthYear:(int)birthYear;

@end

