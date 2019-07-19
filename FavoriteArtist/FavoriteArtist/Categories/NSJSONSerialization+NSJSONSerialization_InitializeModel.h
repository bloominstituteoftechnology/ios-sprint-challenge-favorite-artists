//
//  NSJSONSerialization+NSJSONSerialization_InitializeModel.h
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MRFArtist.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSJSONSerialization (NSJSONSerialization_InitializeModel)
//initializer to initialize your model object from a dictionary
// -(instance)initWithDictionary:(NSDictionary *)myDictionary;
-(void)initWithDictionary:(NSDictionary *)myDictionary;

//a function that returns your model object in a dictionary form.
//-(MRFArtist*)modelObjectFromDictionary:(NSDictionary *)myDictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
