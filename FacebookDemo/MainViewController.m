//
//  MainViewController.m
//  FacebookDemo
//
//  Created by Timothy Lee on 10/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

#import "MainViewController.h"
#import "FBNode.h"
#import "NodeCell.h"
#import <FacebookSDK/FacebookSDK.h>

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSArray *nodes;
@property(weak, nonatomic) IBOutlet UITableView *tableView;

- (void)reload;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self reload];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self.tableView registerNib:[UINib nibWithNibName:@"NodeCell" bundle:nil] forCellReuseIdentifier:@"NodeCell"];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.rowHeight =
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NodeCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NodeCell"];
    cell.node = self.nodes[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nodes.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)reload {
    [FBRequestConnection startWithGraphPath:@"/me/home"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:^(
                                  FBRequestConnection *connection,
                                  id result,
                                  NSError *error
                          ) {

                              NSArray *nodesDictionaries = result[@"data"];

                              self.nodes = [FBNode nodesWithDictionaries:nodesDictionaries];

                              [self.tableView reloadData];
                              NSLog(@"nodes count : %d", self.nodes.count);
                          }];
}

@end
