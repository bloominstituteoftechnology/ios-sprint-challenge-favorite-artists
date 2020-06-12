//
//  LSIQuakeFetcher.m
//  Quakes-Objc
//
//  Created by Bhawnish Kumar on 6/11/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIQuakeFetcher.h"
#import "LSIErrors.h"
#import "LSILog.h"
#import "LSIQuakeResults.h"
#import "LSIQuake.h"

//static variable is going to be limited to only this code files ( versus being global scores all my code)

static NSString *baseURLString = @"https://earthquake.usgs.gov/fdsnws/event/1/query";
@implementation LSIQuakeFetcher

- (void)fetchQuakesTimeInterval:(NSDateInterval *)interval completion:(LSIQuakeFetcherCompletion)completion
{
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLString];
    NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc] init];
    NSString *startTimeString = [formatter stringFromDate:interval.startDate];
    NSString *endTimeString = [formatter stringFromDate:interval.endDate];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"format" value:@"geojson"],
        [NSURLQueryItem queryItemWithName:@"starttime" value:startTimeString],
        [NSURLQueryItem queryItemWithName:@"endtime" value:endTimeString],
    ];
    
    NSURL *url = urlComponents.URL;  // may be nul, FUTURE: make sure it's not nil before using or do something if it's not right.
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { // anything that is not 0  is considered true.
            completion(nil, error);
            return;
        }
        
        if (data != nil) {
            // create an error
            NSError *dataError = errorWithMessage(@"Data is nil and we don0t expect that", LSIDataNilError);
            completion(nil, dataError);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &jsonError];
        
        if(jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        LSIQuakeResults *quakeResults = [[LSIQuakeResults alloc] initWithDictionary:json];
        completion(quakeResults.quakes, nil);
        
    }];
    
    [task resume];
}
@end
