import Foundation

public class Wheel {
    
    public var type:String
    public var size:Int
    public var capacity:Int
    
    init(type:String,size:Int,capacity:Int){
        
        self.type = type
        self.size = size
        self.capacity = capacity
        
    }
    
    func calcCapacity(size:Int)->Int{
        return size*500
        
    }
    
}
