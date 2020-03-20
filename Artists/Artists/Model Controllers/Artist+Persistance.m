//
//  Artist+Persistance.m
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "Artist+Persistance.h"
#import "Artist+NSJSONSerialization.h"

@implementation Artist (Persistance)

- (void)saveToPersistantStore:(NSDictionary *)dictionary {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fileName = [[NSProcessInfo processInfo] globallyUniqueString];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    [NSFileManager.defaultManager createFileAtPath:filePath contents:nil attributes:nil];
    [dictionary writeToFile:filePath atomically:NO];
    NSMutableArray *old = [NSMutableArray new];
    if ([NSUserDefaults.standardUserDefaults objectForKey:@"store"]) {
        old = [NSUserDefaults.standardUserDefaults objectForKey:@"store"];
    }
    [old addObject:fileName];
    [NSUserDefaults.standardUserDefaults setObject:old forKey:@"store"];
}

- (NSMutableArray *)getFromPersistantStore {
    NSMutableArray *names =  [NSUserDefaults.standardUserDefaults objectForKey:@"store"];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSMutableArray *files = [NSMutableArray new];
    for (NSString *name in names) {
        NSString *filePath = [path stringByAppendingPathComponent:name];
        NSLog(filePath);
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
        [files addObject:[[Artist alloc] initWithDictionary:dict]];
    }
    return files;
}

@end
