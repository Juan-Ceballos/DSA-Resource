//: [Previous](@previous)

import Foundation

/*
 Sliding Window problem: is performing an operation on part of an array or linked list starting from the first element and shifting the part your looking through by one. The part can increase, or stay constant. Example finding the longest chain of 1.
 
 Indicators of Sliding Window Problem
 - The problem input is linear data structure such as an array, linked list, string
 - Find longest/shortest subarray or a desired value
 
 Common problems
 - Maximum sum sub array of size k
 - Longest substring with k distinct characters
 - string anagrams
 */


/*
 Two Pointer Iterators: Using two pointers to find a pair result, both pointers iterate in tandem until condition is met. Each one could have an iterative condition. One iterator would require going through collection for multiple or every element for n^2 runtime. Example is finding target sum by having a sorted collection and shifting each iterator until sum found.
 
 Identifying Two Pointers
 - Sorted arr
 - set of elements is pair, triplet, or subset
 
 Common Problems
 - Squaring a sorted array
 - triplets that sum to zero
 - comparing strings that contain backspaces
 */

/*
 Fast and Slow Pointers: Two pointers going through a list at different speeds, in a cyclic list they are bound to meet
 
 Identifying
 - The problem will deal with a loop on a linked list or array
 - When you need to know the position of a certain element or the overall length of the linked list
 
 Two pointer method not viable for singly linked list. Fast and slow ie linked list palindrome
 
 Problems:
 - Linked List Cycle
 - Palindrome Linked List
 - Cycle in a circurlar array
 */
