//
//  QueryService.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/27.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation

class AcquireService {
  let acquireSession = URLSession(configuration: .default)
  
  var promotionsURL = URL(string: "https://workshop-pos-api.herokuapp.com/api/promotions")!
  var allProductsURL = URL(string: "https://workshop-pos-api.herokuapp.com/api/items")!
  
  var products: [Product] = []
  var promoProducts: [String] = []
  
  var dataTask: URLSessionDataTask?
  var errorMessage = ""
  
  typealias ProductResult = ([Product]?, [String]?, String) -> Void
  
  func fetchProductInfo(completion: @escaping ProductResult) {
    let promoteRequest = self.getRequest(promotionsURL)
    let allProductRequest = self.getRequest(allProductsURL)
    
    dataTask?.cancel()
    dataTask = self.acquireSession.dataTask(with: promoteRequest) { [weak self] data, response, error in
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
        self?.fetchAllProduct(allProductRequest, completion: completion)
      }
    }
    self.dataTask?.resume()
  }
  
  func fetchAllProduct(_ request: URLRequest, completion: @escaping ProductResult) {
    dataTask = self.acquireSession.dataTask(with: request) { [weak self] data, response, error in
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
          completion(self?.products, self?.promoProducts, self?.errorMessage ?? "" )
        }
      }
    }
    self.dataTask?.resume()
  }
  
  //  func getPromotedProduct() {
  //    let request = self.getRequest(promotionsURL)
  //    dataTask = self.acquireSession.dataTask(with: request) { [weak self] data, response, error in
  //      defer {
  //        self?.dataTask = nil
  //      }
  //      if let error = error {
  //        self?.errorMessage += "DataTask error: " +
  //          error.localizedDescription + "\n"
  //      } else if
  //        let data = data,
  //        let response = response as? HTTPURLResponse,
  //        response.statusCode == 200 {
  //        self?.parsePromoptionBarcode(data)
  //      }
  //    }
  //    self.dataTask?.resume()
  //  }
  //
  //  func getProductInfo(completion: @escaping ProductResult) {
  //    let request = self.getRequest(allProductsURL)
  //    self.dataTask?.cancel()
  //    dataTask = self.acquireSession.dataTask(with: request) { [weak self] data, response, error in
  //      defer {
  //        self?.dataTask = nil
  //      }
  //      if let error = error {
  //        self?.errorMessage += "DataTask error: " +
  //          error.localizedDescription + "\n"
  //      } else if
  //        let data = data,
  //        let response = response as? HTTPURLResponse,
  //        response.statusCode == 200 {
  //        self?.parseData(data)
  //        self?.getPromotedProduct()
  //        DispatchQueue.main.async {
  //          completion(self?.products, self?.promoProducts, self?.errorMessage ?? "" )
  //        }
  //      }
  //    }
  //    self.dataTask?.resume()
  //
  //
  //  }
  
  func parsePromoptionBarcode(_ data: Data){
    do {
      self.promoProducts = try JSONSerialization.jsonObject(with: data, options: []) as? [String] ?? []
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
      self.products = try JSONDecoder().decode([Product].self, from: data)
    } catch let decodeError as NSError {
      errorMessage += "JSONDecode error: \(decodeError.localizedDescription)"
      return
    }
  }
}
