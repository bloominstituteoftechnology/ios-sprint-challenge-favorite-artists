//
//  VVSArtist.h
//  Favorite Artists
//
//  Created by Vici Shaweddy on 2/7/20.
//  Copyright © 2020 Vici Shaweddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VVSArtist : NSObject

@property (nonatomic) NSString *name; // strArtist
@property (nonatomic) NSUInteger formedYear; // intFormedYear
@property (nonatomic) NSString *biography; // strBiographyEN

- (instancetype)initWithName:(NSString *)name
                  formedYear:(NSUInteger)formedYear
                   biography:(NSString *)biography;

@end

