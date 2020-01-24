//
//  JBFileHelper.h
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import <Foundation/Foundation.h>

NSData *loadFile(NSString *filename, NSBundle *bundle) {
    NSString *basename = [filename stringByDeletingPathExtension];
    NSString *extension = [filename pathExtension];

    NSString *path = [bundle pathForResource:basename ofType:extension];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}
