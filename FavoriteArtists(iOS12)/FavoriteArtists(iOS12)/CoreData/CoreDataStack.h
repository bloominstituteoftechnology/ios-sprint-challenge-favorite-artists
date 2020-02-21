//
//  CoreDataStack.h
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
NS_ASSUME_NONNULL_BEGIN

@interface CoreDataStack : NSObject

@property(class,nonatomic)CoreDataStack *coreDataStack;
@property(nonatomic, readonly) NSPersistentContainer *container;
@property(nonatomic) NSManagedObjectContext *context;
@end

NS_ASSUME_NONNULL_END
