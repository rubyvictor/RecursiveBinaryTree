//: Playground - noun: a place where people can play

import UIKit

// 1.
//              10
//             /  \
//            6    21
//           /    /  \
//          2    13   26

//2.
class Node {
    
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    
    }
}

//left branch
let twoNode = Node(value: 2, leftChild: nil, rightChild: nil)
let sixNode = Node(value: 6, leftChild: twoNode, rightChild: nil)

//right branch

let thirteenNode = Node(value: 13, leftChild: nil, rightChild: nil)
let twentySixNode = Node(value: 26, leftChild: nil, rightChild: nil)
let twentyOneNode = Node(value: 21, leftChild: thirteenNode, rightChild: twentySixNode)

let tenRootNode = Node(value: 10, leftChild: sixNode, rightChild: twentyOneNode)

//3.
//implement an algorithm that searches through this tree to find a particular searchValue
func search(node: Node?, searchValue: Int) -> Bool {
    //if node == nil also works
    if node?.value == nil {
        return false
    }
    
    if node?.value == searchValue {
        return true
    } else {
        //recursion: calling the same method that you're already in with perhaps different params
        return search(node: node?.leftChild, searchValue: searchValue) || search(node: node?.rightChild, searchValue: searchValue)
        }
}

search(node: tenRootNode, searchValue: 30)

//4. The purpose of this recursive method?
//Efficiency!!
//inefficient example: the recursive method is faster (5 times vx 7 times for searchValue == 26) than index loop
let list = [2,6,10,13,21,26]
let index = list.index(where: {$0 == 30})



//5. Improve on the algo by searching in the relevant child i.e. left or right. Half the x times going thru the loop

//              10
//             /  \
//            6    21
//           /    /  \
//          2    13   26

func betterSearch(node: Node?, searchValue: Int) -> Bool {
    
    if node == nil {
        return false
    }
    if searchValue == node!.value {
        return true
    } else if searchValue < node!.value {
        return betterSearch(node: node?.leftChild, searchValue: searchValue)
    } else {
        return betterSearch(node: node?.rightChild, searchValue: searchValue)
    }
}

betterSearch(node: tenRootNode, searchValue: 30)