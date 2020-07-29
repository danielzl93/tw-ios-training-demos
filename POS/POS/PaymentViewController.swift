//
//  PaymentViewController.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/29.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController{
  
  var products: [Product]!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var totalPrice: UILabel!
  @IBOutlet weak var moneySaved: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    self.getTotalPrice { (saved, totalCost) in
      totalPrice.text = "\(totalCost) 元"
      moneySaved.text = "\(saved) 元"
    }
  }
  
  func getTotalPrice(completion: (Double, Double) -> Void) {
    var total = 0.0
    var saved = 0.0
    products.forEach { (product) in
      if let count = product.count, let isPromoted = product.isPromoted {
        total += product.price * Double(count)
        if isPromoted {
          saved += product.price * Double(count / 2)
        }
      }
    }
    completion(saved, total)
  }
  
}

extension PaymentViewController:  UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
    cell.config(newProduct: products[indexPath.row])
    return cell
  }
  
  
}
