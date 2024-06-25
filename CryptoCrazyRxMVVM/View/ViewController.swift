//
//  ViewController.swift
//  CryptoCrazyRxMVVM
//
//  Created by Sümeyra Demirtaş on 24.06.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var cryptoList = [Crypto]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
       cryptoVi
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].currency
        content.secondaryText = cryptoList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }
}
