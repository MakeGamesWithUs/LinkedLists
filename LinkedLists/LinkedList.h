//
//  LinkedList.h
//  LinkedLists
//
//  Created by Daniel Haaser on 11/20/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedList : NSObject

//------------------------------------------
//       Implement these methods!
//------------------------------------------

/**
 Add an object to the end of the linked list
 */
- (void)addObject:(id)object;

/**
 Add an object to the specified index
 */
- (void)addObject:(id)object atIndex:(NSUInteger)index;

/**
 Returns the object at the specified index
 */
- (id)objectAtIndex:(NSUInteger)index;

/**
 Removes the object at the specified index
 */
- (void)removeObjectAtIndex:(NSUInteger)index;

/**
 Returns the number of element stored in the list
 */
- (NSUInteger)count;

@end
