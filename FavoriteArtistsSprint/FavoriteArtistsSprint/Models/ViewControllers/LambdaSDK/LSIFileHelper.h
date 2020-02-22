//
//  LSIFileHelper.h
//
//  Created by Paul Solt on 10/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Loads a file from the bundle where a class resides
/// This is helpful when unit testing to get access to .json and other data files from a unti test target
/// Usage:
///
///     NSData *quakeData = loadFile(@"Quake.json", [LSIQuakeTests class]);
///
/// @param filename the name of the file without any path components (include the extension)
/// @param classType a class in the app / test bundle that can be used to locate the location of a file
NSData *loadFile(NSString *filename, Class classType);

/// Returns the path for a file of a given class type (for use with testing bundles)
/// @param filename the name of the file without any path components (include the extension)
/// @param classType a class in the app / test bundle that can be used to locate the location of a file
NSString *pathForFile(NSString *filename, Class classType);

