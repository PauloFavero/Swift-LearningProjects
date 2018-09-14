//: [Anterior](@previous)
//: # Estruturas Básicas
//:
//: ## Exercício

import Foundation

//: Implemente o algoritmo de Selection Sort em Swift:
//: 
//: Como referência você pode utilizar o algoritmo descrito na
//: [Wikipedia](https://en.wikipedia.org/wiki/Selection_sort)
//:
//: Use o seguinte array como teste

var array = [7,10,5,3,8,4,2,9,6]

//: Escreva aqui o código que altera **array** de acordo com o
//: algoritmo pedido.

let size:Int
func sizeArray(_ array:[Int])->Int {
    
    return array.count
    
}
size=sizeArray(array)

func sort(_ array:inout[Int], _ size:Int ){
    for i in 0..<size{
        for k in (i..<size).reversed(){
            if array[i]>array[k]{
                let temp=array[k]
                array[k]=array[i]
                array[i]=temp
                
                
            }
        }
    }
    
}
sort(&array, size)
//: Este código validará o resultado:

if (array == [2,3,4,5,6,7,8,9,10]) {
    print("Exercício correto!")
} else {
    print("Array não está ordenado: \(array)")
}



