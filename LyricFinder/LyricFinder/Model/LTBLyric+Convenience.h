//
//  LTBLyric+Convenience.h
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTBLyric+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface LTBLyric (Convenience)

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics;

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating managedObjectContext:(NSManagedObjectContext *)moc;

@end

NS_ASSUME_NONNULL_END
