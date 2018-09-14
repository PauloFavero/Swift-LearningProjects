import Foundation

public class Machinist:Person {
    
    public var workload:Int
    public var habilitation:String
    public var salary:Int = 500
    
    public init (workload:Int, habilitation:String, salary:Int, gender:String, age:Int, weight:Int){
        
        self.habilitation = habilitation
        self.workload = workload
        self.salary = salary
        
        super.init(gender: gender, age: age, weight: weight)
    }
    
    convenience init (){
        self.init(workload: 20, habilitation: "A", salary: 100, gender: "Male", age: 50, weight: 70)
    }
    
}
