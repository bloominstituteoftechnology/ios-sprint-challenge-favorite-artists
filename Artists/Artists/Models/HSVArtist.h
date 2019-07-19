//
//  HSVArtist.h
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HSVArtist : NSObject


@property (nonatomic, readonly, copy) 	NSString 	*name;
@property (nonatomic, readonly, copy) 	NSString 	*biography;
@property (nonatomic, readonly) 		int 		yearFormed;


- (instancetype) initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed;


@end

NS_ASSUME_NONNULL_END
