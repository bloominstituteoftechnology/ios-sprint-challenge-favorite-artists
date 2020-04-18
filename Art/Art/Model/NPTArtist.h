//
//  Artist.h
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NPTArtist : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) int yearFormed;



- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed;


@end


