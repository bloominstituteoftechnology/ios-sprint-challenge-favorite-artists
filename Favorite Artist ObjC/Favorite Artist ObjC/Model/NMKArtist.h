//
//  NMKArtist.h
//  Favorite Artist ObjC
//
//  Created by Niranjan Kumar on 1/24/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NMKArtist : NSObject

@property (nonatomic, copy) NSString *artist;
@property (nonatomic, copy) NSString *biography;
@property (nonatomic) int yearFormed;

- (instancetype)initWithArtistName:(NSString *)artist biography:(NSString *)biography yearFormed:(int)yearFormed;

@end

