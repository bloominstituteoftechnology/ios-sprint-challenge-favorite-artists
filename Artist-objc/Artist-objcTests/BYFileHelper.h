//
//  BYFileHelper.h
//  Artist-objc
//
//  Created by Bradley Yin on 10/11/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

#import <Foundation/Foundation.h>


NSData *loadFile(NSString *filename, NSBundle *bundle) {
    NSString *basename = [filename stringByDeletingPathExtension];
    NSString *extension = [filename pathExtension];
    
    NSString *path = [bundle pathForResource:basename ofType:extension];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}
