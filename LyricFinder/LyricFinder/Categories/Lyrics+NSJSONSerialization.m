//
//  Lyrics+NSJSONSerialization.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "Lyrics+NSJSONSerialization.h"
#import "Lyrics.h"

@implementation Lyrics (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    Lyrics *lyrics = [[Lyrics alloc] init];
    lyrics.lyricsBody = [dictionary valueForKey: @"lyrics_body"];
    
    
    
    
    
    
    
    
    
    //    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop){
//        //What is a selector? A selector is a METHOD. A message is a METHOD + ARGUMENTS. Here we are, at RUNTIME, CREATING a NEW METHOD using the KEY.
//        SEL selector = NSSelectorFromString(key);
//        //Here we are sending a MESSAGE to the OBJECT using the SELECTOR to ASK the OBJECT if it contains a property with the NAME of the SELECTOR
//        if ([lyrics respondsToSelector:selector]) {
//            //Here we are LOOKING FOR a method called `setLyricsBody` to SET the PROPERTY with the VALUE. IF THIS METHOD IS NOT FOUND the selector GENERATES a METHOD called `setLyricsBody` to SET the value of the PARAMETER matching the KEY
//            [lyrics.lyrics_body setValue:value forKey:key];
//        }
//    }];
    return lyrics;
     }
     
     
     @end
