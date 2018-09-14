import Foundation

public class Wagon {
    
    private static var count:Int = 0
    public var doors:Bool
    public var capacity:Int
    public private(set) var id:Int
    public var testId: Int {
        return Wagon.count
    }
    
    
    public init(doors:Bool,capacity:Int){
        
        self.doors = doors
        self.capacity = capacity
        self.id = Wagon.count
        Wagon.count += 1
    }
    
}

