//
//  CoreDataStack.h
//  Artists
//
//  Created by brian vilchez on 1/25/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataStack : NSObject

//@property CoreDataStack;
@property(nonatomic) NSManagedObjectContext *context;
@property(nonatomic) NSPersistentContainer *container;


@end

NS_ASSUME_NONNULL_END
