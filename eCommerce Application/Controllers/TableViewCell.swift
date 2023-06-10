//
//  CollectionViewCell.swift
//  eCommerce Application
//
//  Created by Habibur Rahman on 6/8/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()

        }
    
}
