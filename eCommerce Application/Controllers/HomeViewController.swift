//
//  ViewController.swift
//  eCommerce Application
//
//  Created by Habibur Rahman on 6/6/23.
//

import UIKit
import Alamofire
import SDWebImage

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet var tableView: UITableView!
    var product = [ProductElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        self.activityIndicatorView.startAnimating()

        tableView.delegate = self
        tableView.dataSource = self
        
        let url = "https://dummyjson.com/products"
        AF.request(url).responseDecodable(of: Product.self) { response in
            guard let products = response.value else { return }

            self.product = products.products!
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicatorView.stopAnimating()
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.nameLabel?.text = product[indexPath.row].title
        cell.priceLabel?.text = "Price: $\(product[indexPath.row].price!)"
        cell.productImage.sd_setImage(with: URL(string: product[indexPath.row].thumbnail!), placeholderImage: UIImage(systemName: "person"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.productItem = product[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


