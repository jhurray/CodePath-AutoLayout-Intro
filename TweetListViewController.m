//
//  TweetListViewController.m
//  TwitterDemo
//
//  Created by  Jeffrey Hurray on 1/30/17.
//  Copyright © 2017 Jeffrey Hurray. All rights reserved.
//

#import "TweetListViewController.h"
#import "TweetTableViewCell.h"

@interface TweetListViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TweetListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UINib *nib = [UINib nibWithNibName:@"TweetTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TweetTableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell" forIndexPath:indexPath];
    
    if (indexPath.row % 2) {
        cell.retweetContainerHeightConstraint.constant = 0;
    }
    else  {
       cell.retweetContainerHeightConstraint.constant = 24 * indexPath.row;
    }
    [cell setNeedsUpdateConstraints];
    
    return cell;
}

@end
