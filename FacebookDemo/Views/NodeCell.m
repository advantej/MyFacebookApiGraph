//
//  NodeCell.m
//  FacebookDemo
//
//  Created by Tejas Lagvankar on 1/29/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import "NodeCell.h"
#import "FBNode.h"

@interface NodeCell ()
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nodeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusTypeLabel;


@end

@implementation NodeCell

- (void)awakeFromNib {
    // Initialization code

    self.nodeNameLabel.preferredMaxLayoutWidth = self.nodeNameLabel.frame.size.width;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNode:(FBNode *)node {
    _node = node;

    self.userNameLabel.text = node.userName;
    self.nodeNameLabel.text = node.nodeName;
    self.typeLabel.text = node.type;
    self.statusTypeLabel.text = node.statusType;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.nodeNameLabel.preferredMaxLayoutWidth = self.nodeNameLabel.frame.size.width;
}

@end
