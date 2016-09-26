//: Playground - noun: a place where people can play

import UIKit

var str = "123adskjdskljgbdfkljvb"
let num : Int? = Int(str)

let arr = [1,2,3,4,5]

func index(of n : Int, inArray array : [Int]) -> Int?{
    for i in 0..<array.count{
        if array[i] == n{
            return i
        }
    }
    /*
    for (index,num) in array.enumerated(){
        if num == n{
            return index
        }
    }*/
    
    return nil
    
    
}

let idx = index(of: 9, inArray: [0,1,2,3,4,5,6,7,8])

var opArry : [Int]? = nil
opArry = [1,2,3]
opArry = [1,2,3,4]

opArry?[2]

if opArry != nil{
    opArry!.append(3)
}

opArry?.append(3)
let count = opArry?.count

let person : [String:Any]? = [
    "ronen":17,
    "yossi":15.1
    //"first_name":"reuven"
]

var sum = 0
let yo : Int? = person?["yossi"] as? Int

if let ronen = person?["ronen"] as? Int,
    let yossi = person?["yossi"] as? Int{
    sum += ronen
    sum += yossi
}

/*
if let ronen = person["ronen"],
    let yossi = person["yossi"]{
    sum += ronen
    sum += yossi
}
*/
/*
let ronen = person["ronen"]
let yossi : Int? = person["yossi"]

var sum = 0

if ronen != nil{
    sum += ronen!
}

if yossi != nil{
    sum += yossi!
}

sum
*/






















