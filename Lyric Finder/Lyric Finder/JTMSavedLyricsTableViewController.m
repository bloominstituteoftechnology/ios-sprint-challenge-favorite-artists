//
//  JTMSavedLyricsTableViewController.m
//  Lyric Finder
//
//  Created by Jonathan T. Miles on 10/5/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMSavedLyricsTableViewController.h"
#import "JTMLongLyricsController.h"

@interface JTMSavedLyricsTableViewController ()
- (IBAction)addNewLyric:(id)sender;

@property JTMLongLyricsController *songController;
@end

@implementation JTMSavedLyricsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.songController.lyricsDictionaries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LyricsCell" forIndexPath:indexPath];
    
    JTMSongLyrics *lyric = _songController.lyricsDictionaries[indexPath.row];
    
    cell.textLabel.text = lyric.title;
    cell.detailTextLabel.text = lyric.artist;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)addNewLyric:(id)sender {
}
@end
