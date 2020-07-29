//
//  CartTableViewController.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/28.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
  var product: [Product]!
  var totalPrice = 0.0
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var payButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    payButton.setTitle("\(getTotalPrice()) 元， 去结算", for: .normal)
    payButton.backgroundColor = .systemRed
    payButton.addTarget(self, action: #selector(showPaymentPage), for: .touchUpInside)
  }
  
  @objc func showPaymentPage() {
    performSegue(withIdentifier: "showPaymentPage", sender: self.product)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let vc = segue.destination as? PaymentViewController else { return }
    vc.products = sender as? [Product]
  }
  
  func getTotalPrice() -> Double {
    product.forEach { (product) in
      if let count = product.count {
        totalPrice += product.price * Double(count)
      }
    }
    return totalPrice
  }
}

extension CartViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return product.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
    cell.config(newProduct: product[indexPath.row])
    return cell
  }
  
}
