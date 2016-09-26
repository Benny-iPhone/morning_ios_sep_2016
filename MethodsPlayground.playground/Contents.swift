//: Playground - noun: a place where people can play

import UIKit

class MyClass{
    
    var num : Int = 3
    
    func doSomething(){
        
    }
    
    func multipleNum(by : Int){
        num *= by
    }
}

MyClass().doSomething()
let m = MyClass()
m.doSomething()
m.multipleNum(by: 4)
m.num


class Student {
    var name : String
    
    init(name : String) {
        self.name = name
    }
    
    func walk(){
        print("student walks")
    }
}

class IphoneStudent : Student{
    let iOSVersion : Double
    
    init(name : String, version : Double?) {
        self.iOSVersion = version ?? 10.0
        super.init(name: name)
    }
 
    convenience override init(name : String){
        self.init(name: name, version: 10)
    }
    
    /*
    override init(name: String) {
        iOSVersion = 10
        super.init(name: name){
        }
    }*/
    
    override func walk() {
        print("iphoe")
        //super.walk()
    }
    
}
let s1 = IphoneStudent(name: "david")
s1.walk()
IphoneStudent(name: "vic", version: 4)
/*
let s1 = Student(name: "ronen")
let s2 = IphoneStudent(name: "mu", version: nil)
s2.name
s2.iOSVersion
*/



















