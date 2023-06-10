//
//  DetailViewController.swift
//  eCommerce Application
//
//  Created by Habibur Rahman on 6/9/23.
//

import UIKit
import SDWebImage


protocol AddToCart {
    func productAddedToCart()
}

class DetailViewController: UIViewController {
    
    
    
    var product = [ProductElement]()
    var delegate: AddToCart?
    
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    var productItem: ProductElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = productItem?.title,
           let price = productItem?.price,
           let image = productItem?.thumbnail,
           let description = productItem?.description,
           let brand = productItem?.brand,
           let category = productItem?.category {
            nameLabel.text = "Name: \(name)"
            priceLabel.text = "Price: $\(price)"
            productImage.sd_setImage(with: URL(string:image), placeholderImage: UIImage(systemName: "person"))
            descriptionLabel.text = description
            brandLabel.text = "Brand: \(brand)"
            categoryLabel.text = "Category: \(category)"
            
        }
    }
    


    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        print("\(productItem?.title!) is Added To Cart")
        navigationController?.popToRootViewController(animated: true)
    }
    
}
