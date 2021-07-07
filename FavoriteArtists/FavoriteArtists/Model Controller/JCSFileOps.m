//
//  JCSFileOps.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_95 on 4/4/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import "JCSFileOps.h"

@implementation JCSFileOps

@synthesize fileMgr;
@synthesize homeDir;
@synthesize filename;
@synthesize filepath;


-(NSString *) setFilename{
    filename = @"mytextfile.txt";
    
    return filename;
}


-(NSString *)GetDocumentDirectory{
    fileMgr = [NSFileManager defaultManager];
    homeDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    return homeDir;
}

-(void)WriteToStringFile:(NSMutableString *)textToWrite{
    filepath = [[NSString alloc] init];
    NSError *err;
    
    filepath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setFilename];
    
    BOOL ok = [textToWrite writeToFile:filepath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
    
    if (!ok) {
        NSLog(@"Error writing file at %@\n%@",
              filepath, [err localizedFailureReason]);
    }
    
}

-(NSString *) readFromFile
{
    filepath = [[NSString alloc] init];
    NSError *error;
    NSString *title;
    filepath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setFilename];
    NSString *txtInFile = [[NSString alloc] initWithContentsOfFile:filepath encoding:NSUnicodeStringEncoding error:&error];
    
    if(!txtInFile)
    {
        NSLog(@"Unable to get text from file.");
    }
    return txtInFile;
}

@end
