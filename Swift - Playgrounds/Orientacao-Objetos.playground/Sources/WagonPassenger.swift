import Foundation

public class CargoPassenger:Wagon{
    
    public var qntPassenger:Int
    public var qntWheels:Int
    public var qntSeat:Int
    public var passenger:[Passenger] = []
    
    public init (qntPassenger:Int, qntWheels:Int, qntSeat:Int,id:Int){
        self.qntSeat = qntSeat
        self.qntPassenger = qntPassenger
        self.qntWheels = qntWheels
        
      super.init(doors: true, capacity: self.qntSeat*70)
        
    }
    
    
}
