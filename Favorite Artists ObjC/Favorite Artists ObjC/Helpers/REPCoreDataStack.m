//
//  REPCoreDataStack.m
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//


#import "REPCoreDataStack.h"

@interface REPCoreDataStack() {
	NSPersistentContainer* _container;
}
@end


@implementation REPCoreDataStack

static REPCoreDataStack* _sharedInstance = nil;

+ (REPCoreDataStack *)sharedInstance {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedInstance = [[REPCoreDataStack alloc] init];
	});
	return _sharedInstance;
}

- (NSManagedObjectContext *)mainContext {
	return self.container.viewContext;
}

- (NSPersistentContainer *)container {
	if (!_container) {
		_container = [NSPersistentContainer persistentContainerWithName:@"REPArtist"];

		[_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
			if (error) {
				NSLog(@"error loading persistent store: %@", error);
				exit(1);
			}
		}];
		_container.viewContext.automaticallyMergesChangesFromParent = true;
	}

	return _container;
}

- (void)saveContext:(NSManagedObjectContext *)context error:(NSError *)error {
	__block NSError* tError;
	[context performBlockAndWait:^{
		[context save:&tError];
	}];
	error = tError;
}

@end

