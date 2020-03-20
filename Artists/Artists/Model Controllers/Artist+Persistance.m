//
//  Artist+Persistance.m
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "Artist+Persistance.h"

@implementation Artist (Persistance)

- (void)saveToPersistantStore:(NSDictionary *)dictionary {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%lu", (unsigned long)dictionary.hash];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    [NSFileManager.defaultManager createFileAtPath:filePath contents:nil attributes:nil];
    [dictionary writeToFile:filePath atomically:NO];
    NSMutableArray *old = [NSMutableArray new];
    old = [NSUserDefaults.standardUserDefaults objectForKey:@"store"];
    [old addObject:filePath];
    [NSUserDefaults.standardUserDefaults setObject:fileName forKey:@"store"];
}

- (NSMutableArray *)getFromPersistantStore {
    NSMutableArray *names =  [NSUserDefaults.standardUserDefaults objectForKey:@"store"];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    [NSFileManager.defaultManager createFileAtPath:path contents:nil attributes:nil];
    NSMutableArray *files = [NSMutableArray new];
    for (NSString *name in names) {
        NSString *filePath = [path stringByAppendingPathComponent:name];
        [files addObject:[[NSDictionary alloc] initWithContentsOfFile:filePath]];
    }
    return files;
}

@end
