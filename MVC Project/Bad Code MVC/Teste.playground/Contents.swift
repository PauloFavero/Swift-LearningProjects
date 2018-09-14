//: Playground - noun: a place where people can play

import UIKit

var window: UIWindow?
let viewController = UIViewController()
var availableItemsView: UIView!
var itemsToBePurchasedView: UIScrollView!
var totalLabel: UILabel!
var selectedItems = [UIView]()
var selectedPrices = [Double]()
var removeAllButton: UIButton!
var itemSymbols = ["🍔", "🍦", "🍕", "🍜", "🍗"]
var itemNames = ["hamburguer", "ice cream", "pizza", "noodles", "chicken"]
var itemPrices = [2.0, 0.5, 1.0, 5.0, 4.5]


func createViewController()    {
    viewController.view.backgroundColor = UIColor.white
    window?.rootViewController = viewController
    
    var yOffset = 0
    print("width")
    print(Int(viewController.view.bounds.width))
    print("height")
    print(Int(viewController.view.bounds.height/CGFloat(itemNames.count)))
    print(itemNames.count)
    
    
    availableItemsView = UIView(frame: CGRect(x: 0, y: yOffset, width: Int(viewController.view.bounds.width), height: 10+Int(viewController.view.bounds.height/CGFloat(itemNames.count))))
    availableItemsView.backgroundColor = UIColor.groupTableViewBackground
    viewController.view.addSubview(availableItemsView)
    
    yOffset = Int(availableItemsView.bounds.size.height)
    
    let availableItemsTitle = UILabel(frame: CGRect(x: 10, y: 10, width: Int(availableItemsView.bounds.width - 20), height: Int(availableItemsView.bounds.height)/itemNames.count))
    print(Int(availableItemsView.bounds.width - 20))
    print(Int(availableItemsView.bounds.height)/itemNames.count)
    availableItemsTitle.font = UIFont(name: "Helvetica", size: 20)
    availableItemsTitle.textColor = UIColor.black
    availableItemsTitle.textAlignment = .left
    availableItemsTitle.text = "Choose your meal:"
    availableItemsView.addSubview(availableItemsTitle)
    
    let itemViewSize = CGSize(width: Int(availableItemsView.bounds.width-5)/itemNames.count, height: Int(availableItemsView.bounds.height) - Int(availableItemsTitle.bounds.height))
    
    
    for index in 0...itemNames.count-1 {
        let currentItem = UIButton(frame: CGRect(x: 5+(Int(itemViewSize.width)*index), y: 5 + Int(availableItemsTitle.bounds.height), width: Int(itemViewSize.width-5), height: Int(itemViewSize.height-10)))
        currentItem.setTitle("\(itemSymbols[index])", for: .normal)
        currentItem.titleLabel?.font = UIFont(name: "Helvetica", size: 50)
        currentItem.titleLabel?.textAlignment = .center
        currentItem.titleLabel?.textColor = UIColor.black
        currentItem.backgroundColor = UIColor.white
        currentItem.layer.cornerRadius = 2.0
        currentItem.layer.shadowOffset = CGSize(width: 1, height: 1)
        currentItem.layer.shadowColor = UIColor.black.cgColor
        currentItem.layer.shadowOpacity = 0.1
        currentItem.tag = index
        
        availableItemsView.addSubview(currentItem)
    }
    
    itemsToBePurchasedView = UIScrollView(frame: CGRect(x: 0, y: yOffset, width: Int(viewController.view.bounds.width), height: Int(viewController.view.bounds.size.height) - yOffset))
    itemsToBePurchasedView.backgroundColor = UIColor.groupTableViewBackground
    itemsToBePurchasedView.contentSize = itemsToBePurchasedView.bounds.size
    itemsToBePurchasedView.layer.cornerRadius = 2.0
    itemsToBePurchasedView.layer.borderWidth = 1.0
    itemsToBePurchasedView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
    viewController.view.addSubview(itemsToBePurchasedView)
    
   
    
}
createViewController()
