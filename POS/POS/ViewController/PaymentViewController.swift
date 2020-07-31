//
//  PaymentViewController.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/29.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController{

  var cart: CartViewModel!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var totalPrice: UILabel!
  @IBOutlet weak var moneySaved: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    totalPrice.text = "\(self.cart.totalPrice) 元"
    moneySaved.text = "\(self.cart.totalSaved) 元"
  }
}

extension PaymentViewController:  UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.cart.getConfirmCart().count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
    cell.config(productViewModel: self.cart.getConfirmCart()[indexPath.row])
    return cell
  }


}
