//
//  JLCArtistController.m
//  Favorite-Artists-ST
//
//  Created by Jake Connerly on 11/8/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

#import "JLCArtistController.h"
#import "JLCArtist.h"

@implementation JLCArtistController

static NSString *const baseURLString = @"theaudiodb.com/api/v1/json/1/search.php";

- (void)searchForArtistWithArtistName:(NSString *)artistName
                           completion:(void (^)(JLCArtist *artist, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *artistToSearch = [NSURLQueryItem queryItemWithName:@"s" value:artistName];
    [components setQueryItems:@[artistToSearch]];
    
    NSURL *url = [components URL];
    NSLog(@"url: %@", url);
    
}

@end
