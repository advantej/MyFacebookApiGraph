//
// Created by Tejas Lagvankar on 1/29/15.
// Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FBNode : NSObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *nodeName;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *statusType;

- (id) initWithDictionary:(NSDictionary *) dictionary;
+ (NSArray *) nodesWithDictionaries:(NSArray *) dictionaries;

@end