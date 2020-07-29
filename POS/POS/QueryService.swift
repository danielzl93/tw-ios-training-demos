//
//  QueryService.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/27.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation

class QueryService {
  let querySession = URLSession(configuration: .default)
  var products: [Product] = []
  var promoProducts: [String] = []
  
  var dataTask: URLSessionDataTask?
  var errorMessage = ""
  
  typealias ProductResult = ([Product]?, String) -> Void
    
  func getProductInfo(completion: @escaping ProductResult) {
    
    guard let promotionsURL = URLComponents(string: "https://workshop-pos-api.herokuapp.com/api/promotions")?.url else { return }
    guard let allProductsURL = URLComponents(string: "https://workshop-pos-api.herokuapp.com/api/items")?.url else { return }
    let promptRequest = self.getRequest(promotionsURL)
    let allProductsRequest = self.getRequest(allProductsURL)
    self.executePromoTask(promptRequest)
    self.executeTask(allProductsRequest, completion: completion)
  }
  
  func executePromoTask(_ urlRequest: URLRequest) {
    self.dataTask?.cancel()
    dataTask = self.querySession.dataTask(with: urlRequest) { [weak self] data, response, error in
      defer {
        self?.dataTask = nil
      }
      if let error = error {
        self?.errorMessage += "DataTask error: " +
          error.localizedDescription + "\n"
      } else if
        let data = data,
        let response = response as? HTTPURLResponse,
        response.statusCode == 200 {
        self?.parsePromoptionBarcode(data)
      }
    }
    self.dataTask?.resume()
  }
  
  func executeTask(_ urlRequest: URLRequest, completion: @escaping ProductResult) {
    dataTask = self.querySession.dataTask(with: urlRequest) { [weak self] data, response, error in
      defer {
        self?.dataTask = nil
      }
      if let error = error {
        self?.errorMessage += "DataTask error: " +
          error.localizedDescription + "\n"
      } else if
        let data = data,
        let response = response as? HTTPURLResponse,
        response.statusCode == 200 {
        self?.parseData(data)
        DispatchQueue.main.async {
          completion(self?.products, self?.errorMessage ?? "")
        }
      }
    }
    self.dataTask?.resume()
  }
  
  func parsePromoptionBarcode(_ data: Data){
    do {
      if let promoBarcodes = try JSONSerialization.jsonObject(with: data, options: []) as? [String] {
        promoProducts = promoBarcodes
      }
    } catch {
      print(error.localizedDescription)
    }
  }
  
  
  func getRequest(_ url: URL) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("5bCP5YCf5YCf", forHTTPHeaderField: "identifier")
    return request
  }
  
  func parseData(_ data: Data) {
    do {
      try JSONDecoder().decode([Product].self, from: data).forEach({ (product) in
        var newProduct = product
        newProduct.isPromoted = self.promoProducts.contains(product.barcode)
        newProduct.count = 0
        self.products.append(newProduct)
      })
    } catch let decodeError as NSError {
      errorMessage += "JSONDecode error: \(decodeError.localizedDescription)"
      print(errorMessage)
      return
    }
  }
}
