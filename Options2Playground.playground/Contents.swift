//: Playground - noun: a place where people can play

import UIKit

var num1 : Int? = 3

num1? += 1
if num1 != nil{
    num1! += 1
}

num1

let num_2 = num1 != nil ? num1! : 0
let num2 = num1 ?? 0


let qube : [[Int]] = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

let five = qube[1][1]

//let arr1 = [Int](repeatElement(0, count: 30))//[]
let arr2 : [Int] = []

//let obj = arr1[3]
let item : Int? = arr2.first

if let firstItem = arr2.first{
    print(firstItem)
} else {
    print("not first item")
}

var arr3 : [Int]?

if let firstItem = arr3?.first{
    print(firstItem)
}

let str1 = "4"
let val : Int? = Int(str1)

let arr4 : [String]? = ["34","41","1"]

extension Int{
    init?(_ str : String?){
        if let str = str, let val = Int(str){
            self = val
        } else {
            return nil
        }
    }
}

if let num = Int(arr4?.first){
    
}

if let first = arr4?.first, let num = Int(first){
    print(num)
} else {
    
}

var arr5 : [Double]? = [M_PI]

arr5?.append(7)
arr5?.insert(2, at: 0)

arr5

var arr6 : [String] = ["a","c","b"]

arr6.sort { (s1, s2) -> Bool in
    return s1 < s2
}

arr6

func mySortFunc(_ s1 : String,_ s2 : String) -> Bool{
    return s2 < s1
}

arr6.sort(by: mySortFunc)

arr6

var a = 3
var b = 5
/*var c = a
a = b
b = c

a
b
*/


/*
 Swift 2
func mySwap(inout a : Int, inout b : Int){
    
}
 */

func mySwap( a : inout Int, b : inout Int) -> Void{
    a = a + b
    b = a - b
    a = a - b
}

mySwap(a: &a, b: &b)
a
b



































