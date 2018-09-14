import Foundation

public class Train {
    
    public var wagons:[Wagon] = []
    private static var count:Int = 0
    public var capacityPassenger:Int
    public var qntWagon:Int = 0
    public private(set) var id:Int
    public var driver:Machinist = Machinist()
    public var locomotive:Locomotive = Locomotive()
    
    
    init (qntWagon:Int, capacityPassenger:Int){
        self.id = Train.count
        Train.count += 1
        self.capacityPassenger = capacityPassenger
        self.qntWagon = wagons.count
        
    }
    
    
}
