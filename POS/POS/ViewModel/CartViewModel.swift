//
//  CartViewModel.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/30.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation

protocol CartViewModelDelegate {
  func didFinishFetchingProduct(_ viewModel: CartViewModel?, completion: @escaping () -> Void)
}

class CartViewModel {

  let acquireSession = AcquireService()
  var cartViewModelDelegate: CartViewModelDelegate?
  
  var products = [ProductViewModel]()
  var totalSaved : Double {
    return self.products.reduce(0.0) { $0 + $1.product.price * Double($1.promoteCount) }
  }
  var totalPrice : Double {
    return self.products.reduce(0.0) { $0 + $1.subCost }
  }
  
  init() {
    self.products = []
  }
  
  func fetchProducts(completion: @escaping () -> Void) {
    acquireSession.fetchProductInfo {[weak self] (fetchedProducts, promoteBarcode, error) in
      if let products = fetchedProducts {
        products.forEach { (product) in
          self?.products.append(ProductViewModel(product: product, isPromoted: promoteBarcode?.contains(product.barcode) ?? false))
        }
      }
      self?.products.forEach({ (product) in
        print(product.isPromoted)
      })
      self?.cartViewModelDelegate?.didFinishFetchingProduct(self, completion: completion)
    }
  }
  
  func getConfirmCart() -> [ProductViewModel] {
    return products.filter{ $0.count > 0 }
  }
  
  func addProductCount(index: Int) {
    products[index].count += 1
  }
  
  func minusProductCount(index: Int) {
    products[index].count -= 1
  }
  
  func cleanCart() {
    products.forEach { (product) in
      product.count = 0
    }
  }
}



