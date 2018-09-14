//
//  Order.swift
//  Bad Code MVC
//
//  Created by Paulo Henrique Favero Pereira on 3/23/17.
//  Copyright © 2017 Paulo Henrique Favero Pereira. All rights reserved.
//

import Foundation
import UIKit

class Order: NSObject {
    


private(set) var itemNames = ["Hamburguer", "Ice Cream", "Pizza", "Noodles", "Chicken"]
private(set) var itemPrices = [2.0, 0.5, 1.0, 5.0, 4.5]
private(set) var itemSymbols = ["🍔", "🍦", "🍕", "🍜", "🍗"]

func itemPrice(_ item:String)->Float{
    var itemPrice = 0.0
    
    switch item {
        
    case "🍔":
        itemPrice = itemPrices[0]
    case "🍦":
        itemPrice = itemPrices[1]
    case "🍕":
        itemPrice = itemPrices[2]
    case "🍜":
        itemPrice = itemPrices[3]
    case "🍗":
        itemPrice = itemPrices[4]
        
        
    default:
        print("")
    }
    return Float(itemPrice)
}

    func itemName(_ item:String)->String{
    var productName:String = ""
    
        switch item {
            
        case "🍔":
        productName = itemNames[0]
        case "🍦":
            productName = itemNames[1]
        case "🍕":
            productName = itemNames[2]
        case "🍜":
            productName = itemNames[3]
        case "🍗":
            productName = itemNames[4]
            
            
        default:
            print("")
        }
        return String(productName)
    }

}
