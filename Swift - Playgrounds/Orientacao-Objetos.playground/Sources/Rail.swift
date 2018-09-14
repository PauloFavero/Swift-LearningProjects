import UIKit

class Rail  {

    public var size:Int
    public var type:String
    public var capacity:Int = 0
    
    
    init(size:Int, type:String){
        self.size = size
        self.type = type
        
    }
    
    func setCapacity(type:String){
    
        let railType = type
        
    switch railType {
    
    case "wood":
    capacity = 1000
    
    case "iron":
    capacity = 5000
    
    default:
    
    capacity = 500
    }
    
    
    
}

}
