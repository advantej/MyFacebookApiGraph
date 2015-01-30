//
//  SettingCell.h
//  FacebookDemo
//
//  Created by Tejas Lagvankar on 1/29/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingCell;

@protocol SettingCellDelegate <NSObject>

- (void)settingCell:(SettingCell *)settingCell didUpdateValue:(BOOL)value;

@end

@interface SettingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) id<SettingCellDelegate> delegate;
@property (nonatomic, assign) BOOL on;

- (void)setOn:(BOOL)on animated:(BOOL)animated;
@end
