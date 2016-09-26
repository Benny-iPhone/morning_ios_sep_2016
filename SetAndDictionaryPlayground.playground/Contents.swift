//: Playground - noun: a place where people can play

import UIKit
import CoreLocation

//var str = "Hello, playground"

var s1 : Set<String> = []
s1.insert("abc")
s1.insert("def")

s1

s1.insert("abc")

s1

let firstSet : Set<Int> = [1,2,3,4]
let secondSet : Set<Int> = [3,4,5,6]

let u = firstSet.union(secondSet)
let i = firstSet.intersection(secondSet)

/*
 Dictionray 
 a.k.a hashmap
 */

let ages : Dictionary <String,Int> = [
    "david":14,
    "steve":50
]

let person : [String:String] = [
    "first_name":"avraham",
    "last_name":"cohen"
]

let location = CLLocation(latitude: 34.455, longitude: 31.233234)

var fullPerson : [String:Any] = [
    "first_name":"itzik",
    "age":23,
    "height":1.80,
    "location":location
]

let now = NSDate()
now.timeIntervalSince1970

//add new
fullPerson["birthdate"] = NSDate(timeIntervalSince1970: 1474546561)

fullPerson
//override
fullPerson["first_name"] = "ronen"

fullPerson

var str1 = ""
for (key,val) in person{
    str1 += key + "=" + val + "&"
}

str1









