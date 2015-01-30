//
//  SettingsViewController.m
//  FacebookDemo
//
//  Created by Tejas Lagvankar on 1/29/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingCell.h"

@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource, SettingCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *settingTypes;

- (void)onCloseButton;
- (void)onApplyButton;
- (NSString *)getKeyForIndexPath:(NSIndexPath *)indexPath;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.settingTypes = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@{@"Home Feed":@NO, @"Photos":@NO, @"Movies":@NO, @"Books":@NO}, nil];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(onCloseButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(onApplyButton)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SettingCell" bundle:nil] forCellReuseIdentifier:@"SettingCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SettingCellDelegate Method
- (void)settingCell:(SettingCell *)settingCell didUpdateValue:(BOOL)value {
    self.settingTypes[@"Home Feed"] = @NO;
    self.settingTypes[@"Photos"] = @NO;
    self.settingTypes[@"Movies"] = @NO;
    self.settingTypes[@"Books"] = @NO;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:settingCell];
    // unselect other value
    self.settingTypes[[self getKeyForIndexPath:indexPath]] = value ? @YES : @NO;
    [self.tableView reloadData];
}

#pragma mark - TableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.settingTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SettingCell" forIndexPath:indexPath];
    cell.on = [self.settingTypes valueForKey:[self getKeyForIndexPath:indexPath]];
    return cell;
}


#pragma mark - Private Methods

- (NSString *)getKeyForIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return @"Home Feed";
        case 1:
            return @"Photos";
        case 2:
            return @"Movies";
        case 3:
            return @"Books";
    }
    return nil;
}

- (void)onCloseButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onApplyButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
