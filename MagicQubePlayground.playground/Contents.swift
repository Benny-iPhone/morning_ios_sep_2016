//: Playground - noun: a place where people can play

import UIKit

func isNumberGuard(str : String?) -> Bool{
    guard let str = str, !str.isEmpty else {
        return false
    }
    
    return Double(str) != nil
}

isNumberGuard(str: "12.3")

func isNumber(str : String?) -> Bool{
    if str == nil{
        return false
    }
    
    if str!.isEmpty{
        return false
    }
    
    return Double(str!) != nil
}


var arr : [[Int]] = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]



func checkMagicQube(_ qube : [[Int]]) -> Bool{
    var testSum = 0
    for num in qube[0]{
        testSum += num
    }
    let size = qube.count
    
    var mainDiagonalSum = 0
    var secondaryDiagonalSum = 0
    
    for i in 0..<size{
        
        mainDiagonalSum += qube[i][i]
        secondaryDiagonalSum += qube[i][qube[i].endIndex - 1 - i]
        
        var rowSum = 0
        var columnSum = 0
        
        for j in 0..<size{
            rowSum += qube[i][j]
            columnSum += qube[j][i]
        }
        
        guard rowSum == testSum && columnSum == testSum else {
            return false
        }
        
        /*
        if rowSum != testSum || columnSum != testSum{
            //not magic
            return false
        }*/
    }
    
    if mainDiagonalSum != testSum || secondaryDiagonalSum != testSum{
        return false
    }
    
    return true
}


checkMagicQube(arr)
checkMagicQube([[1,1,1],[1,1,1],[1,1,1]])
