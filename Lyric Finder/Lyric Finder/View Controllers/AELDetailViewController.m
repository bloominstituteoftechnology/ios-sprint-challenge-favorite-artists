//
//  AELDetailViewController.m
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import "AELDetailViewController.h"
#import "AELSong.h"
#import "AELSongController.h"

@interface AELDetailViewController ()

@end

@implementation AELDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateView];
}

-(void) updateView
{
    if (![self isViewLoaded]){
        return;
    }
    if([self song]){
        //if there is a song
        [[self songTitleField] setText: [[self song] title]];
        [[self artistField] setText: [[self song] artist]];
        [[self lyricTextView] setText: [[self song] lyrics]];
        
        
    } else {
        
    }
}


- (IBAction)save:(id)sender {
}

- (IBAction)ratingControl:(id)sender {
}

- (IBAction)search:(id)sender {
}
@end
