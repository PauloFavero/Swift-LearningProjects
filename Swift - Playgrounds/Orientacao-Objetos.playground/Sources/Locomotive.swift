//: Playground - noun: a place where people can play

import UIKit

public class Locomotive {
    
    public var type:String
    public var velocity:Int
    public var hp:Int
    public var qntFuel:Int
    public var fuelType:String
    
    public init(type:String, velocity:Int, hp:Int, qntFuel:Int, fuelType:String) {
        
        self.type = type
        self.velocity = velocity
        self.hp = hp
        self.qntFuel = qntFuel
        self.fuelType = fuelType
    }
    
    convenience init(){
        self.init(type: "Bullet", velocity: 250, hp: 600, qntFuel: 100, fuelType: "Gasoline")
    }
    
    func calcVelocity(hp:Int, qntfuel:Int) -> Int{
        
        self.velocity = hp*2/qntfuel
        return velocity
    }
    
    
    
}
