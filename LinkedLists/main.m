//
//  main.m
//  LinkedLists
//
//  Created by Daniel Haaser on 11/20/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"

#define LOG_ELEMENTS 0

extern uint64_t dispatch_benchmark(size_t count, void (^block)(void));

static const int ELEMENTS_SIZE = 2500;


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {        
        LinkedList* linkedListOfNumbers = [LinkedList new];
        
        // Check if addObject is implemented
        if (![linkedListOfNumbers respondsToSelector:@selector(addObject:)])
        {
            NSLog(@"ERROR: Can't run tests... implement addObject!");
            return 1;
        }
        
        //  Benchmark adding a bunch of elements
        uint64_t creationTime = dispatch_benchmark(1, ^
        {
           for (int i = 0; i < ELEMENTS_SIZE; ++i)
           {
               [linkedListOfNumbers addObject:@(i)];
           }
           
       });
        
        NSLog(@"Creation time: %llu ms", creationTime / 1000000);

        // Check if count is implemented
        if (![linkedListOfNumbers respondsToSelector:@selector(count)])
        {
            NSLog(@"ERROR: Can't run tests... implement count!");
            return 1;
        }
        
        // Check if count is implemented correctly
        uint64_t countTime = dispatch_benchmark(1, ^
        {
            NSUInteger count = [linkedListOfNumbers count];
            
            if (count == ELEMENTS_SIZE)
            {
                NSLog(@"Count implemented and returns a good value.");
            }
        });
        
        NSLog(@"Count time: %llu nanoseconds", countTime);
        
        // Check if objectAtIndex is implemented
        if (![linkedListOfNumbers respondsToSelector:@selector(objectAtIndex:)])
        {
            NSLog(@"ERROR: objectAtIndex not implemented!");
            return 1;
        }
        
        // Check if objectAtIndex is correct
        NSNumber* indexZeroObject = [linkedListOfNumbers objectAtIndex:0];
        NSNumber* indexFiveObject = [linkedListOfNumbers objectAtIndex:5];
        NSNumber* lastIndexObject = [linkedListOfNumbers objectAtIndex:ELEMENTS_SIZE - 1];
        
        if (indexZeroObject.integerValue == 0 &&
            indexFiveObject.integerValue == 5 &&
            lastIndexObject.integerValue == (ELEMENTS_SIZE - 1))
        {
            NSLog(@"objectAtIndex implemented");
        }
        else
        {
            NSLog(@"ERROR: objectAtIndex implemented INCORRECTLY!");
        }
        
        // Check if addObject:atIndex: is implemented
        if (![linkedListOfNumbers respondsToSelector:@selector(addObject:atIndex:)])
        {
            NSLog(@"ERROR: addObject:atIndex: not implemented!");
            return 1;
        }
        
        // Check for addObject:atIndex: correctness
        [linkedListOfNumbers addObject:@(1337) atIndex:0];
        [linkedListOfNumbers addObject:@(31337) atIndex:10];
        [linkedListOfNumbers addObject:@(731337) atIndex:[linkedListOfNumbers count]];
        
        NSNumber* leet = [linkedListOfNumbers objectAtIndex:0];
        NSNumber* eleet = [linkedListOfNumbers objectAtIndex:10];
        NSNumber* wat = [linkedListOfNumbers objectAtIndex:[linkedListOfNumbers count] - 1];
        
        if (leet.integerValue == 1337 &&
            eleet.integerValue == 31337 &&
            wat.integerValue == 731337)
        {
            NSLog(@"addObject:atIndex: implemented.  Nice.");
        }
        else
        {
            NSLog(@"ERROR:  addObject:atIndex: is so WRONG!  OH NO!!!");
        }
        
        // Check if removeOjectAtIndex: is implemented
        if (![linkedListOfNumbers respondsToSelector:@selector(removeObjectAtIndex:)])
        {
            NSLog(@"ERROR: removeObjectAtIndex: not implemented!");
            return 1;
        }
        
        // Check for removeObjectAtIndex correctness

        [linkedListOfNumbers removeObjectAtIndex:[linkedListOfNumbers count] - 1];
        [linkedListOfNumbers removeObjectAtIndex:10];
        [linkedListOfNumbers removeObjectAtIndex:0];
        
        NSNumber* element = nil;
        BOOL removeObjectIsCorrect = YES;
        
        for (int i = 0; i < ELEMENTS_SIZE; ++i)
        {
            element = [linkedListOfNumbers objectAtIndex:i];
            
            if (element.integerValue != i)
            {
                NSLog(@"ERROR: removeObjectAtIndex not implemented correctly!");
                removeObjectIsCorrect = NO;
                break;
            }
        }
        
        if (removeObjectIsCorrect)
        {
            NSLog(@"removeObjectAtIndex is implemented correctly.  w00t!");
        }
        
        
#if LOG_ELEMENTS
        NSNumber* number = nil;
        
        for (int i = 0; i < [linkedListOfNumbers count]; ++i)
        {
            number = [linkedListOfNumbers objectAtIndex:i];
            
            NSLog(@"%d", number.intValue);
        }
#endif
        
    }
    
    return 0;
}
