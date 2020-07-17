//
//  AppDelegate.h
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

