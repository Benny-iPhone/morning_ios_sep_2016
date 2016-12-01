//: Playground - noun: a place where people can play

import UIKit

public func solution(_ N : Int) -> Int {
    // write your code in Swift 3.0 (Linux)
    
    let str = String(N, radix: 2)
    
    var maxSum = 0
    var sum = 0
    var isInGap = false
    
    for c in str.characters{
        if c == "1"{
            
            maxSum = max(maxSum, sum)
            sum = 0
            isInGap = true
            
        } else if c == "0"{
            if isInGap{
                sum += 1
            }
        }
    }
    
    return maxSum
    
}

solution(98349825)