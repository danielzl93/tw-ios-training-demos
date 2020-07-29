//
//  ProductTableViewCell.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/28.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
  var product: Product!
  
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var productUnit: UILabel!
  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var count: UILabel!
  @IBOutlet weak var minusButton: UIButton!
  @IBOutlet weak var plusButton: UIButton!
  
  
  func config(newProduct: Product) {
    self.product = newProduct
    self.productName.text = product.name
    self.productUnit.text = product.unit
    self.productImage.image = UIImage(named: product.name)?.resizeImage(targetSize: CGSize(width: 65, height: 65))
    self.price.text = String(format: "%.1f 元", product.price)
    if let count = product.count {
      self.count.text = String(count)
    }
    minusButton.addTarget(self, action: #selector(minusClick), for: .touchUpInside)
    plusButton.addTarget(self, action: #selector(plusClick), for: .touchUpInside)
  }
  
  @objc func minusClick() {
    guard let countString = self.count.text else { return }
    if let count = Int(countString) {
      if count >= 1 {
        self.count.text = String(count - 1)
        self.product.count! -= 1
      }
    }
  }
  
  @objc func plusClick() {
    guard let countString = self.count.text else { return }
    if let count = Int(countString) {
      if count >= 0 {
        self.count.text = String(count + 1)
        self.product.count! += 1
      }
    }
  }
  
}

extension UIImage {
  
  func resizeImage(targetSize: CGSize) -> UIImage {
    let size = self.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    var newSize: CGSize
    if(widthRatio > heightRatio) {
      newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
      newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
  }
}
