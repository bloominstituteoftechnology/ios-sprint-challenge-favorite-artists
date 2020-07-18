//
//  JEVArtist.h
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JEVArtist : NSObject


//MARK: Model Properties

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *biography;
@property (nonatomic, readonly) NSInteger year;

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                        year:(NSInteger)year;

@end

NS_ASSUME_NONNULL_END
