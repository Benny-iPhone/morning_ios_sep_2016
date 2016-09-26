//: Playground - noun: a place where people can play

import UIKit

/*
 Ex 1
 */

let מספר = 43
let 😃😃😃 = "smiley"
let num1 = 5
let num2 = 6

😃😃😃

num1 + num2
num1 - num2
num1 * num2
Double(num1) / Double(num2)

func doSomething(_ num : Double){
    
}

doSomething(5)

/*
 func doSomething(num : Double){
 
 }

 */
//doSomething(num: 4)

/*
func doSomething(extenalNumName num : Double){
    
}
doSomething(extenalNumName: 4)
*/
func mutli(a a : Int, b : Int) -> Int{
    return a * b
}

mutli(a : num1, b : num2)

/*
 Ex 2
 */

let a : Double = 3//726
let b = 4.0//1.0
let c : Double = 5//sqrt(pow(726, 2) + 1)

let isPitagozie = a*a + b*b == c*c

if pow(a, 2) + pow(b, 2) == pow(c, 2){
    //print("pita")
} else {
    //print("not pita")
}


let t = (val : 13, name: "king")
t.name
t.1


func isPita(a : Double, b : Double, c : Double) -> Bool{
    return pow(a, 2) + pow(b, 2) == pow(c, 2)
}

isPita(a: 6, b: 8, c: 10)

/*
 Ex 3 + 4
 */

let radius : Double = 20


func hekef(radius r : Double) -> Double{
    let pi = M_PI
    return 2 * pi * r
}

hekef(radius: radius)

func shetach(radius r : Double) -> Double{
    let pi = M_PI
    return pi * pow(r, 2)
}

shetach(radius: radius)
//shetach(radius: 5)


/*
 Ex 5
 */
//external name internal name
let num : UInt = 1
func atzeret(of n : UInt) -> UInt{
    if n == 0{
        return 0
    }
    
    var sum : UInt = 1
    
    //for i : UInt in 1..<n{//not include n
    for i : UInt in 1...n{//include n
        sum *= i
    }
    
    return sum
}

atzeret(of: 6)
/*
let first = 0
let last = 10
let interval = 2
var n = 0
// f never used, so alt. 'for _ in ...'
for f in stride(from: first, through: last, by: interval) {
    n += 1
    print(f)
}
*/
var d = 3
for i in stride(from: 0, through: 10, by: 1){
    print(i)
}
for i in stride(from: 0, to:100 , by: d){
    print(i)
}

let myArray = [1,4,5,7,878,78,8,87,8,8,4,10]
for num in myArray{
    
}















