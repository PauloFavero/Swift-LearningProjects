//: Playground - noun: a place where people can play

import UIKit

class Locomotive {
    
    public var type:String
    public var velocity:Int
    public var hp:Int
    public var qntFuel:Int
    public var fuelType:String
    
    
    init(type:String, velocity:Int, hp:Int, qntFuel:Int, fuelType:String) {
        self.type = type
        self.velocity = velocity
        self.hp = hp
        self.qntFuel = qntFuel
        self.fuelType = fuelType
    }
    
    func calcVelocity(hp:Int, qntfuel:Int) -> Int{
        
    self.velocity = hp*2/qntfuel
        return velocity
    }
}

let wagon1 = Wagon(doors: true,capacity: 10)
let wagon2 = Wagon(doors: false, capacity: 20)


print(wagon1.id)
print(wagon1.testId)
print(wagon2.id)

print(wagon1.id)
print(wagon2.id)