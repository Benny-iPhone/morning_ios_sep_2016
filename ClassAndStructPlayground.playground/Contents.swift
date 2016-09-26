//: Playground - noun: a place where people can play

import UIKit

enum Hobby{
    case diving
    case surfing
}

class Person{
    var firstName : String = ""
    var lastName = ""
    
    var fullName : String{
        get{
            return firstName + " " + lastName
        }
        set (newFullName){
            let arr = newFullName.components(separatedBy: " ")
            firstName = arr.first ?? ""
            lastName = arr.last ?? ""
        }
    }
    
    var hobby : Hobby = .diving
    
    var father : Person?// = Person()
    lazy var mother : Person = Person()
    
}

let p1 = Person()
p1.fullName
p1.firstName = "yossi"
p1.lastName = "Levi"
p1.fullName
p1.firstName + " " + p1.lastName
p1.fullName = "שלום עליכם"
p1.firstName

p1.father = Person()
p1.father?.firstName = "avi"

p1.mother

let p2 = Person()
p2.father = p1

p2.father?.lastName
p2.father?.father?.firstName



















