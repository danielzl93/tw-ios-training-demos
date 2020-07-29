//
//  CartTableViewCell.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/29.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

  var product: Product!
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var purchasedCount: UILabel!
  @IBOutlet weak var productCost: UILabel!
  @IBOutlet weak var promoteCount: UILabel!
  
  func config(newProduct: Product) {
    self.product = newProduct
    self.productName.text = self.product.name
    if let count = self.product.count {
      self.purchasedCount.text = "数量：\(count) \(self.product.unit)"
      self.promoteCount.text = "x \(count / 2)"
      self.productCost.text = String(format: "%.1f 元", self.product.price * Double(count))
    }
    self.productImage.image = UIImage(named: self.product.name)?.resizeImage(targetSize: CGSize(width: 65, height: 65))
    
  }
  
  
  
}
