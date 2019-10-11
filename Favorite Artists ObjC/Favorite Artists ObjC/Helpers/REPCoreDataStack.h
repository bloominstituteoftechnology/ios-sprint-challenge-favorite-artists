//
//  REPCoreDataStack.h
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface REPCoreDataStack : NSObject

+ (REPCoreDataStack*)sharedInstance;

@property (readonly) NSManagedObjectContext* mainContext;
@property (readonly) NSPersistentContainer* container;

- (void)saveContext:(NSManagedObjectContext*)context error:(NSError*)error;

@end

