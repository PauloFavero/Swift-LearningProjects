import Foundation

public class Passenger:Person {
    
    public var checkedLuggage:Bool
    public var origim:String
    public var destination:String
    
    
    public init(checkedLuggage:Bool, origim:String,destination:String, gender:String, age:Int, weight:Int){
        self.checkedLuggage = checkedLuggage
        self.origim = origim
        self.destination = destination
        
        super.init(gender: gender, age: age, weight: weight)
        
    }
        
    
}
