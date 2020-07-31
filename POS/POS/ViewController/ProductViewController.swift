//
//  ViewController.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/27.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController{
  

  
  var cart: CartViewModel!
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var cartButton: UIButton!
  @IBOutlet weak var cleanButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupButtonsUI()
    cart = CartViewModel()
    cart.fetchProducts {
      self.tableView.reloadData()
    }
    cart.cartViewModelDelegate = self
    tableView.estimatedRowHeight = 100
    tableView.rowHeight = UITableView.automaticDimension
    tableView.dataSource = self
  }
  @IBAction func clickToCart(_ sender: Any) {
    performSegue(withIdentifier: "goToCart", sender: self.cart)
  }
  @IBAction func clickCleanCart(_ sender: Any) {
    self.cart.cleanCart()
    self.tableView.reloadData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.tableView.reloadData()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let cartViewController = segue.destination as? CartViewController else { return }
    cartViewController.cart = sender as? CartViewModel
  }
  
  func setupButtonsUI() {
    for button in [cartButton, cleanButton] {
      guard let button = button else { return }
      button.backgroundColor = .yellow
      button.layer.cornerRadius = 10
      button.layer.borderWidth = 2
      button.layer.borderColor = UIColor.brown.cgColor
      button.contentEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
    }
  }
}

extension ProductViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cart?.products.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else { return UITableViewCell()}
    if let product = self.cart?.products[indexPath.row] {
      cell.config(
        productViewModel: product,
        addProductHandler: { [weak self] in
          self?.cart.addProductCount(index: indexPath.row)
          tableView.reloadData()
        },
        minusProductHandler: { [weak self] in
          if product.count > 0 {
            self?.cart.minusProductCount(index: indexPath.row)
            tableView.reloadData()
          }
      })
    }
    return cell
  }
}

extension ProductViewController: CartViewModelDelegate {
  func didFinishFetchingProduct(_ viewModel: CartViewModel?, completion: @escaping () -> Void) {
    self.cart = viewModel
    completion()
  }
}


