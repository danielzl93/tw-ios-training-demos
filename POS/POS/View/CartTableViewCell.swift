//
//  CartTableViewCell.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/29.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var purchasedCount: UILabel!
  @IBOutlet weak var productCost: UILabel!
  @IBOutlet weak var promoteCount: UILabel!
  
  func config(productViewModel: ProductViewModel) {
    self.productName.text = productViewModel.product.name
    self.purchasedCount.text = "数量：\(productViewModel.count) \(productViewModel.product.unit)"
    self.promoteCount.text = "\(productViewModel.promoteCount)"
    self.productCost.text = String(format: "%.1f 元", productViewModel.product.price * Double(productViewModel.count))
    self.productImage.image = UIImage(named: productViewModel.product.name)?.resizeImage(targetSize: CGSize(width: 65, height: 65))
  }
}
