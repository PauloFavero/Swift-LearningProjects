//
//  ViewController.swift
//  Bad Code MVC
//
//  Created by Paulo Henrique Favero Pereira on 3/23/17.
//  Copyright © 2017 Paulo Henrique Favero Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //MARK: Outlets TableView
    @IBOutlet weak var tableOfItems: UITableView!
    
    @IBOutlet weak var itensAndPrice: UILabel!
    
    @IBOutlet weak var hiddenRemoveAll: UIButton!
    
    //MARK: Variables Declaration and Initialization
    
    var order:Order = Order()
    var table:ViewControlerTableViewCell = ViewControlerTableViewCell()
    var totalPrice:Float = 0.0
    
    struct itemPurchased {
        let name: String
        let price: Float
        let image: String
    }
    private var selectedItems: [itemPurchased] = [itemPurchased]()
    
    /// Remove all the itens of the shopping cart and hide the button and table view
    ///
    /// - Parameter sender: Button RemoveAll
    @IBAction func removeItensButton(_ sender: UIButton) {
        itensAndPrice.text = "0 items - Total: $0.0"
        selectedItems.removeAll() // Clear the array of items
        tableOfItems.reloadData() // Clear the table view
        tableOfItems.isHidden = true // Hide Table View
        hiddenRemoveAll.isHidden = true //hide remove all
        totalPrice = 0.0
        
        
    }
    
    /// Change the quantity of items and actualize the price of shopping cart
    ///
    /// - Parameters:
    ///   - item: Quantity of items
    ///   - totalPrice: Total price of the order
    func orderInformation(_ item: Int, _ totalPrice: Float) {
        // Change the text based on the items quantity
        if item == 1{
            self.itensAndPrice.text =  "\(item) item - Total: $\(totalPrice)"
        }
        else{
            self.itensAndPrice.text =  "\(item) items - Total: $\(totalPrice)"
        }
    }
    
    /// Action to add the items to shopping cart
    ///
    /// - Parameter sender:  Item Buttons
    @IBAction func itemSelected(_ sender: UIButton) {
        //Show table and remove all button in the view
        hiddenRemoveAll.isHidden = false
        tableOfItems.isHidden = false
        
        //Actualize the total price and calls the function to show order informations
        totalPrice +=  order.itemPrice(String(sender.titleLabel!.text!))
        
        // Take the information of the button and save in the struct item
        selectedItems.append(itemPurchased(name: order.itemName(sender.titleLabel!.text!) , price: order.itemPrice(sender.titleLabel!.text!), image: sender.titleLabel!.text!))
        orderInformation(selectedItems.count,totalPrice)
        
        tableOfItems.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide the button remove all and the table on the beggin of aplication
        hiddenRemoveAll.isHidden = true
        tableOfItems.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: methods TableView
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return (selectedItems.count)
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControlerTableViewCell
        
        cell.imageItemCell.text = selectedItems[indexPath.row].image
        cell.nameItemCell.text = selectedItems[indexPath.row].name
        cell.priceItemCell.text = "$" + String(selectedItems[indexPath.row].price)
        
        return cell
    }
    
    
    
}

