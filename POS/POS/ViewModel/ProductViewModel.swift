//
//  ProductViewModel.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/29.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation
import UIKit

class ProductViewModel {
  
  var product: Product
  var count: Int
  var promoteCount: Int {
    return self.isPromoted ? self.count / 2 : 0
  }
  var isPromoted: Bool
  var subCost: Double {
    return Double(self.count) * self.product.price
  }
  
  init(product: Product, isPromoted: Bool) {
    self.product = product
    self.count = 0
    self.isPromoted = isPromoted
  }
}
