//: Playground - noun: a place where people can play

import UIKit

class Car{
    let vNumber : String
    let createDate : Date
    
    var color : UIColor
    var isManualGear : Bool
    var brand : String
    var doors : UInt8
    
    func doSomething(){
        
    }
    
    init(vNumber : String, createDate : Date) {
        self.vNumber = vNumber
        self.createDate = createDate
        
        color = UIColor.white
        isManualGear = false
        brand = "toyota"
        doors = 5
        //here designated initializer process ends
        doSomething()
    }
    
    convenience init(vNumber : String) {
        self.init(vNumber: vNumber, createDate: Date())
    }
    
    /*
     //old designated initializer
    init(vNumber : String) {
        self.vNumber = vNumber
        createDate = Date()
    }
 */
    
}

let c1 = Car(vNumber: "12-123-12", createDate: Date(timeIntervalSinceNow: -86_400))

let myTarente = Car(vNumber: "12-345-67")
myTarente.color = UIColor.white


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

let color2 = UIColor(netHex: 0xff33cc)

let color = UIColor.black
let color1 = UIColor(red: 153.0/255.0, green: 204/255.0, blue: 1, alpha: 1)
























