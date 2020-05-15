//
//  ViewController.m
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "ViewController.h"
#import "LSIAudioDBClient.h"

@interface ViewController ()

@property LSIAudioDBClient *audioDBClient;

- (void)setUp;

@end

@implementation ViewController


// MARK: - Init

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.audioDBClient = [[LSIAudioDBClient alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Test Fetch
    [self.audioDBClient fetchArtistsForQuery:@"Macklemore" completion:^(NSArray<LSIArtist *> * _Nullable artists, NSError * _Nullable error) {
        NSLog(@"%lu", artists.count);
    }];
}


@end
