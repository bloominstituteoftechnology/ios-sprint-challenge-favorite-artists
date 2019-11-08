//
//  JLCFileLoader.h
//  Favorite-Artists-ST
//
//  Created by Jake Connerly on 11/8/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

#import <Foundation/Foundation.h>

NSData *loadFile(NSString *filename, NSBundle *bundle) {
    NSString *basename = [filename stringByDeletingPathExtension];
    NSString *extension = [filename pathExtension];
    
    NSString *path = [bundle pathForResource:basename ofType:extension];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}
