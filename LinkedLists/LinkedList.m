//
//  LinkedList.m
//  LinkedLists
//
//  Created by Daniel Haaser on 11/20/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import "LinkedList.h"
#import "Node.h"

@interface LinkedList ()

@property (nonatomic, strong) Node* rootNode;

@end

@implementation LinkedList

- (void)addObject:(id)object
{
    // If the root node is nil, create it and add the object to it
    if (!self.rootNode)
    {
        self.rootNode = [Node new];
        self.rootNode.data = object;
    }
    else
    {
        // Otherwise, traverse the linked list, and add a new last node
        Node* currentNode = self.rootNode;
        
        while (currentNode.next != nil)
        {
            currentNode = currentNode.next;
        }
        
        Node* lastNode = [Node new];
        lastNode.data = object;
        
        currentNode.next = lastNode;
    }
}

- (void)addObject:(id)object atIndex:(NSUInteger)index
{
    // Special case: index 0 means the root node
    if (index == 0)
    {
        if (!self.rootNode)
        {
            // If the root node doesn't exist, create it
            self.rootNode = [Node new];
            self.rootNode.data = object;
        }
        else
        {
            // Otherwise, create a new root and make the old root be the next node
            Node *oldRoot = self.rootNode;
            
            self.rootNode = [Node new];
            self.rootNode.data = object;
            self.rootNode.next = oldRoot;
        }
    }
    else
    {
        Node* nodeBefore = [self nodeAtIndex:index - 1];
        Node* nodeAfter = nodeBefore.next;
        
        Node* newNode = [Node new];
        newNode.data = object;
        nodeBefore.next = newNode;
        newNode.next = nodeAfter;
    }
}

- (id)objectAtIndex:(NSUInteger)index
{
    Node* node = [self nodeAtIndex:index];
    
    if (node)
    {
        return node.data;
    }
    else
    {
        return nil;
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    if (index == 0)
    {
        if (self.rootNode)
        {
            self.rootNode = self.rootNode.next;
        }
    }
    else
    {
        Node* nodeBefore = [self nodeAtIndex:index - 1];
        Node* nodeToRemove = nodeBefore.next;
        Node* nodeAfter = nil;
        
        if (nodeToRemove && nodeToRemove.next)
        {
            nodeAfter = nodeToRemove.next;
        }
        
        nodeBefore.next = nodeAfter;
    }
}

- (NSUInteger)count
{
    if (!self.rootNode)
    {
        return 0;
    }
    
    Node* currentNode = self.rootNode;
    NSUInteger count = 1;
    
    while (currentNode.next)
    {
        currentNode = currentNode.next;
        ++count;
    }
    
    return count;
}

- (Node*)nodeAtIndex:(NSUInteger)index
{
    Node* currentNode = self.rootNode;
    NSUInteger currentIndex = 0;
    
    while (currentIndex != index)
    {
        currentNode = currentNode.next;
        ++currentIndex;
        
        if (!currentNode)
        {
            return nil;
        }
    }
    
    return currentNode;
}

@end
