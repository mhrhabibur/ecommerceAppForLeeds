//
//  CartViewController.swift
//  eCommerce Application
//
//  Created by Habibur Rahman on 6/6/23.
//

import UIKit



class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        title = "Cart"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Check Out", style: .done, target: self, action: #selector(checkOutButton))
    }
    
    @objc func checkOutButton() {
        let checkOutVC = storyboard?.instantiateViewController(withIdentifier: "checkOutVC") as! CheckOutViewController
        navigationController?.pushViewController(checkOutVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Ok"
        return cell
    }
    
}
