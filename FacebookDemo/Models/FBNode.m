//
// Created by Tejas Lagvankar on 1/29/15.
// Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import "FBNode.h"


@implementation FBNode

- (id) initWithDictionary:(NSDictionary *) dictionary {

    self = [super init];
    if (self) {
        self.userName = [dictionary valueForKeyPath:@"from.name"];
        self.nodeName = dictionary[@"name"];
        self.type = dictionary[@"type"];
        self.statusType = dictionary[@"status_type"];
    }

    return self;
}


+ (NSArray *) nodesWithDictionaries:(NSArray *) dictionaries {

    NSMutableArray *fbNodes = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        FBNode *node = [[FBNode alloc] initWithDictionary:dictionary];
        [fbNodes addObject:node];
    }
    return fbNodes;
}


@end