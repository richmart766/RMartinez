//
//  GlobalController.swift
//  MartinezR
//
//  Created by Martinez, Richard on 3/13/18.
//  Copyright © 2018 Martinez, Richard. All rights reserved.
//

import UIKit

class GlobalController: NSObject {
    static var nameArray:Array<String> = []
    static var nameBadArray:Array<String> = []
    static var  moneyArray:Array<Double> = []
    static var moneyBadArray:Array<Double> = []
    
    
    class func addBadName(newName: String){
        GlobalController.nameBadArray.append(newName)
    }
    class func addMoneyBad(newMoney: Double){
        GlobalController.moneyBadArray.append(newMoney)
    }
    class func removeBadName(name: String){
        let index = GlobalController.nameBadArray.index(of: name)
        if(index == nil){
            return
        }
        GlobalController.moneyBadArray.remove(at: index!)
        GlobalController.nameBadArray.remove(at: index!)
    }
    
    class func remover(name: String){
        if(nameArray.contains(name)){
            removeName(name: name)
            return
        }
        if(nameBadArray.contains(name)){
            removeBadName(name: name)
            return
        }
    }
    
    
    class func addName(newName: String){
        GlobalController.nameArray.append(newName)
    }
    class func addMoney(newMoney: Double){
        GlobalController.moneyArray.append(newMoney)
    }
    class func removeName(name: String){
        let index = GlobalController.nameArray.index(of: name)
        if(index == nil){
            return
        }
        GlobalController.moneyArray.remove(at: index!)
        GlobalController.nameArray.remove(at: index!)
    }
    class func TotalLent() -> Double{
        var total = 0.0
        for current in moneyArray{
            total = total + current
        }
        return total
    }
    
    class func TotalOwed() -> Double{
        var total = 0.0
        for current in moneyBadArray{
            total = total + current
        }
        return total
    }
    
    class func TotalAmount() -> Double{
        var total = 0.0
        for current in moneyArray{
            total = total + current
        }
        for current in moneyBadArray{
            total = total - current
        }
        return total
    }
}
