import Foundation

public class WagonCargo:Wagon {
    
    public var cargoType:String
    public var cargoPound:Int
    public var company:String
    
    public init(cargoType:String, cargoPound:Int, company:String, id:Int){
        self.cargoType = cargoType
        self.cargoPound = cargoPound
        self.company = company
        
        super.init(doors: false, capacity: 1000)
    }
}
