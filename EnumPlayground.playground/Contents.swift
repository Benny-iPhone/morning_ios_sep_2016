//: Playground - noun: a place where people can play

import UIKit

enum WeekDay : Int{
    case sunday = 1 //0 if not defined
    case monday, tuesday
    case wednesday, thursday, friday
    case saturday
    
    mutating func makePrevDay(){
        self = self.prevDay()
    }
    func prevDay() -> WeekDay{
        return WeekDay(rawValue: self.rawValue - 1) ?? WeekDay.saturday
    }
    
    mutating func makeNextDay(){
        self = self.nextDay()
    }
    
    func nextDay() -> WeekDay{
        return WeekDay(rawValue: self.rawValue + 1) ?? WeekDay.sunday
        /*
        if let next = WeekDay(rawValue: self.rawValue + 1){
            return next
        } else {
            return WeekDay.sunday
        }*/
    }
}

var d = WeekDay.saturday
d.makeNextDay()
d


let day1 : WeekDay = WeekDay.sunday
let day1Next = day1.nextDay()
let day2 : WeekDay = .sunday
let day3 = WeekDay.sunday
let day4 : WeekDay?

day1.rawValue
let day5 : WeekDay? = WeekDay(rawValue: 50)
let day6 : WeekDay = WeekDay(rawValue: 1)!









