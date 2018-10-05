//
//  NSJSONSerialization+NSJSONSerialization.m
//  LyricFinder
//
//  Created by Carolyn Lea on 10/5/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

#import "NSJSONSerialization+NSJSONSerialization.h"

@implementation NSJSONSerialization (NSJSONSerialization)

//-(instancetype)initWithDictionary:(NSDictionary *)songDictionary song:(Song *)song
//{
//
//}
//
//-(NSDictionary *)objectDictionary
//{
//
//}

-(void)searchForLyricsWithSongTitle:(NSString *)songTitle completion:(void (^)(NSArray * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString:artistGET];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];
    
    [request setValue:apiKey forHTTPHeaderField:@"X-Mashape-Key"];
}

@end
