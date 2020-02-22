//
//  BFVCoreDataStack.h
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
NS_ASSUME_NONNULL_BEGIN

@interface BFVCoreDataStack : NSObject

+ (BFVCoreDataStack *) shared;

@property(nonatomic) NSPersistentContainer *container;
@property(nonatomic) NSManagedObjectContext *mainContext;
@end

NS_ASSUME_NONNULL_END
