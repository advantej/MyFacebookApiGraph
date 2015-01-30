//
//  SettingCell.m
//  FacebookDemo
//
//  Created by Tejas Lagvankar on 1/29/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import "SettingCell.h"

@interface SettingCell()

@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
- (IBAction)switchValueChanged:(id)sender;


@end

@implementation SettingCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setOn:(BOOL)on {
    [self setOn:on animated:NO];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated {
    _on = on;
    [self.toggleSwitch setOn:on animated:animated];
}

- (IBAction)switchValueChanged:(id)sender {
    [self.delegate settingCell:self didUpdateValue:self.toggleSwitch.on];
}
@end
