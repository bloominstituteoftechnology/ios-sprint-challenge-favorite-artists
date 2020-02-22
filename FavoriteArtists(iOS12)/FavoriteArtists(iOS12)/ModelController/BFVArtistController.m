//
//  BFVArtistController.m
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "BFVArtistController.h"
#import "BFVCoreDataStack.h"
#import "BFVArtist+Convenience.h"
#import <CoreData/CoreData.h>
@interface BFVArtistController()

@property (nonatomic) NSMutableArray *internalArtists;
@property(nonatomic) NSURL *baseURL;
typedef void(^artistCompletion)(NSError * nullable);
@end

@implementation BFVArtistController

- (NSURL *)baseURL {
    return [NSURL URLWithString:@"https://www.theaudiodb.com/api/v1/json/1/search.php?s"];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalArtists = [[NSMutableArray alloc] init];
        [self getFileFromDocumentsDirectory];
    }
    return self;
}
- (void)saveToPersistentStore
{
    NSError *error = nil;
    if (![[[BFVCoreDataStack shared] mainContext] save:&error]) {
        NSLog(@"Error saving moc: %@", error);
    }
}

- (NSArray *)artists {
    return [self internalArtists];
}
- (void)fetchArtistFromApi:(NSString *)artist completionHandler:(artistCompletion)completion {
    NSURLRequest *request = [self getURLForArtistName:artist];
    
    NSURLSessionTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"error getting data: %@", error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *artistJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            return completion(error);
        }
        
        if(![artistJson isKindOfClass:[NSDictionary class]]) {
            return completion([[NSError alloc]init]);
        }
        
        NSArray *artistResults = artistJson[@"artists"];
        for (NSDictionary *artistDictionary in artistResults) {
            
            // checking For nil/null values
            [self checkDictionaryForValues:artistDictionary];
            
        }
        
        completion(nil);
    }];
    [dataTask resume];
}
- (void)checkDictionaryForValues:(NSDictionary *)dictionary {
    NSMutableDictionary *artistDictionary = [[NSMutableDictionary alloc]init];
    
    if ([[dictionary valueForKey:@"intFormedYear"]  isEqual: [NSNull null]]) {
        [artistDictionary setValue: @"0" forKey:@"yearFormed"];
        [artistDictionary setValue:[dictionary valueForKey:@"strArtist"] forKey:@"artist"];
        [artistDictionary setValue:[dictionary valueForKey:@"strBiographyEN"] forKey:@"biography"];
        
        NSManagedObjectContext *context = [[BFVCoreDataStack shared]mainContext];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Artist" inManagedObjectContext:context];
        BFVArtist *artist = [[BFVArtist alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
        
        artist.bandName = artistDictionary[@"artist"];
        artist.yearFormed = [artistDictionary[@"yearFormed"] intValue]  ;
        artist.biography = artistDictionary[@"biography"];
        [self saveToPersistentStore];
    } else {
        NSManagedObjectContext *context = [[BFVCoreDataStack shared]mainContext];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Artist" inManagedObjectContext:context];
        BFVArtist *artist = [[BFVArtist alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
       
        artist.bandName = dictionary[@"strArtist"];
        artist.yearFormed = [dictionary[@"intFormedYear"]intValue]  ;
        artist.biography = dictionary[@"strBiographyEN"];
        NSLog(@"%@", artist.bandName);
        NSLog(@"%@", dictionary[@"strArtist"]);
        [self saveToPersistentStore];
    }
}

- (NSURL *)documentsDirectory {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask ]lastObject];
    documentsURL = [documentsURL URLByAppendingPathComponent:@"favoriteArtists"];
    NSLog(@"%@",documentsURL);
    return documentsURL;
}

- (void)saveToDocumentsDirectory:(BFVArtist *)artist {
    //    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    //    NSInteger *yearFormed = (NSInteger) artist.yearFormed;
    //    [dictionary setValue:artist.bandName forKey:@"artistName"];
    //    [dictionary setValue: [NSString stringWithFormat:@"%ld", yearFormed] forKey:@"yearFormed"];
    //    [dictionary setValue:artist.biography forKey:@"biography"];
    //    [dictionary writeToURL:[self documentsDirectory] atomically:true];
}

- (void)getFileFromDocumentsDirectory {
    //    NSDictionary *dictionary = [[NSDictionary alloc]initWithContentsOfURL:[self documentsDirectory]];
    //    BFVArtist *artist = [[BFVArtist alloc] initWithDictionary:dictionary];
    //    [[self internalArtists] addObject:artist];
    //    NSLog(@"%@", dictionary);
}

- (NSURLRequest *)getURLForArtistName:(NSString *)name {
    NSURLComponents *components = [NSURLComponents componentsWithURL:self.baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *searchArtist = [NSURLQueryItem queryItemWithName:@"s" value:name];
    components.queryItems = @[searchArtist];
    NSURLRequest *request = [NSURLRequest requestWithURL:components.URL];
    return request;
}

- (NSMutableArray *)internalArtists {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Artist"];
    NSSortDescriptor *discriptor = [[NSSortDescriptor alloc] initWithKey:@"bandName" ascending:true];
    fetchRequest.sortDescriptors = @[discriptor];
     NSManagedObjectContext *moc = [[BFVCoreDataStack shared] mainContext];
     NSError *error = nil;
     NSArray *results = [moc executeFetchRequest:fetchRequest error:&error];
     if (!results) {
         NSLog(@"Error saving moc: %@", error);
     }
    NSLog(@"%@", results);
    return [NSMutableArray arrayWithArray:results];
    
}
@end
