//
//  ViewController.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/27.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController{
  
  @IBOutlet weak var tableView: UITableView!
  let queryService = QueryService()
  var productsResult: [Product] = []
  var tableViewCell = [IndexPath: ProductTableViewCell]()
  var productCart: [Product] = []
  

  @IBOutlet weak var cartButton: UIButton!
  @IBOutlet weak var cleanButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.estimatedRowHeight = 100
    tableView.rowHeight = UITableView.automaticDimension
    
    setupButtonsUI()
    tableView.dataSource = self
    queryService.getProductInfo { [weak self] (results, error) in
      if let result = results {
        self?.productsResult = result
        guard let count = self?.productsResult.count else { return }
        self?.tableViewCell.reserveCapacity(count)
        self?.tableView.reloadData()
      }
    }
    cartButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
    cleanButton.addTarget(self, action: #selector(deselectAll), for: .touchUpInside)
  }
  
  @objc func deselectAll() {
    self.tableViewCell.forEach { (key, cell) in
      cell.count.text = String(0)
    }
    productCart.removeAll()
    self.tableView.reloadData()
  }
  
  
  @objc func goToCart() {
    self.productCart.removeAll()
    self.tableViewCell.forEach { (key, cell) in
      if let product = cell.product {
        guard let count = product.count else { return }
        if count > 0 {
          self.productCart.append(product)
        }
      }
    }
    performSegue(withIdentifier: "goToCart", sender: self.productCart.sorted(by: { (previous, current) -> Bool in
      previous.barcode < current.barcode
    }))
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let vc = segue.destination as? CartViewController else { return }
      vc.product = sender as? [Product]
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
    return productsResult.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else { return UITableViewCell()}
    cell.config(newProduct: productsResult[indexPath.row])
    tableViewCell[indexPath] = cell
    return cell
  }
  
  
}


