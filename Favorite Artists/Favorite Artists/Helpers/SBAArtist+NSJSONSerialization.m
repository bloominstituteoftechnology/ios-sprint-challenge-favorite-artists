//
//  SBAArtist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import "SBAArtist+NSJSONSerialization.h"

@implementation SBAArtist (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
  
  NSArray *artistContainer = dictionary[@"artists"];
  NSDictionary *artistsResultsDictionary = artistContainer[0];
  
  NSString *artistName = artistsResultsDictionary[@"strArtist"];
  if ([artistName isKindOfClass:[NSNull class]]) { artistName = @"Artist was not found";}
  //  else if (![artistName isKindOfClass:[NSString class]]) return nil;
  //
  NSString *artistBiography = artistsResultsDictionary[@"strBiographyEN"];
  if ([artistBiography isKindOfClass:[NSNull class]]) { artistBiography = @"Artist Bio was not found";}
  //  else if (![artistBiography isKindOfClass:[NSString class]]) return nil;
  
  NSString *artistYearFormed = artistsResultsDictionary[@"intFormedYear"];
  if ([artistYearFormed isKindOfClass:[NSNull class]]) { artistYearFormed = nil;}
  
  self = [[SBAArtist alloc] initWithArtistName:artistName biography:artistBiography yearFormed:artistYearFormed == nil ? 1 : artistYearFormed.intValue];  //incase year formed is nil
  return self;
}

//Add a method that returns your model object as a NSDictionary (to save artists).
- (NSDictionary *)toDictionary {
  NSMutableDictionary *dictionaryContainer = [[NSMutableDictionary alloc] init];
  NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
  
  [dictionary setValue:self.name forKey:@"strArtist"];
  [dictionary setValue:self.biography forKey:@"strBiographyEN"];
  NSString *yearFormed = [NSString stringWithFormat:@"%d", self.yearFormed];
  [dictionary setValue:yearFormed forKey:@"intFormedYear"];
  
  NSArray *artistsContainer = [[NSArray alloc] initWithObjects:dictionary, nil];
  
  [dictionaryContainer setValue:artistsContainer forKey:@"artists"];
  
  return dictionaryContainer;
}

-(NSURL *)urlForArtist {
  NSURL *documentsDirectory = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
  
  NSURL *saveFileURL = [documentsDirectory URLByAppendingPathComponent:self.name];
  
  return saveFileURL;
}

- (BOOL)saveToPersistence {

  NSURL *saveFileURL = [self urlForArtist];
  NSDictionary *dictRepresentation = self.toDictionary;
  
  NSLog(@"%@", saveFileURL);
  NSError *saveError = nil;
  [dictRepresentation writeToURL:saveFileURL error:&saveError];
  
  if (saveError) {
    NSLog(@"Error saving %@", saveError);
    return false;
  }
  return true;
}

@end
