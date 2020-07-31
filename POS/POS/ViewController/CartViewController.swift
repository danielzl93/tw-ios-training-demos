//
//  CartTableViewController.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/28.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
  var cart: CartViewModel!
  var totalPrice = 0.0
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var payButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    payButton.setTitle("\(cart.totalPrice) 元， 去结算", for: .normal)
    payButton.backgroundColor = .systemRed
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    self.cart.cleanCart()
    payButton.setTitle("0 元， 去结算", for: .normal)
    tableView.reloadData()
  }
  @IBAction func clickToPay(_ sender: Any) {
    performSegue(withIdentifier: "showPaymentPage", sender: self.cart)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let paymentViewController = segue.destination as? PaymentViewController else { return }
    paymentViewController.cart = sender as? CartViewModel
  }
}

extension CartViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return cart.getConfirmCart().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell else { return UITableViewCell()}
    if let product = self.cart?.getConfirmCart()[indexPath.row] {
      cell.config(productViewModel: product)
    }
    return cell
  }
  
}
