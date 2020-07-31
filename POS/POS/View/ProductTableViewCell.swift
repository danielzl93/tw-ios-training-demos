//
//  ProductTableViewCell.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/28.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var productUnit: UILabel!
  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var count: UILabel!
  @IBOutlet weak var minusButton: UIButton!
  @IBOutlet weak var plusButton: UIButton!
  
  var addProductHandler: (() -> Void)?
  var minusProductHandler: (() -> Void)?
  
  func config(productViewModel: ProductViewModel, addProductHandler: (() -> Void)?, minusProductHandler: (() -> Void)?) {
    self.productName.text = productViewModel.product.name
    self.productUnit.text = productViewModel.product.unit
    self.productImage.image = UIImage(named: productViewModel.product.name)?.resizeImage(targetSize: CGSize(width: 65, height: 65))
    self.price.text = String(format: "%.1f 元", productViewModel.product.price)
    self.count.text = String(productViewModel.count)
    self.addProductHandler = addProductHandler
    self.minusProductHandler = minusProductHandler
  }
  
  @IBAction func addProductButton(_ sender: Any) {
    self.addProductHandler?()
  }
  
  @IBAction func minusProductButton(_ sender: Any) {
    self.minusProductHandler?()
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
