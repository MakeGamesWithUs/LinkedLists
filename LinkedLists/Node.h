//
//  Node.h
//  LinkedLists
//
//  Created by Daniel Haaser on 11/20/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, strong) Node* next;
@property (nonatomic, strong) id data;

@end
