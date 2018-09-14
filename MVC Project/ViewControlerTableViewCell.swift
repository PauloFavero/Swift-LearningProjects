//
//  ViewControlerTableViewCell.swift
//  Bad Code MVC
//
//  Created by Paulo Henrique Favero Pereira on 3/23/17.
//  Copyright © 2017 Paulo Henrique Favero Pereira. All rights reserved.
//

import UIKit

class ViewControlerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameItemCell: UILabel!
    @IBOutlet weak var priceItemCell: UILabel!
    @IBOutlet weak var imageItemCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
