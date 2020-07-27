//
//  MomentRequest.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/26.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation

class MomentRequest {
  let defaultSession = URLSession(configuration: .default)
  
  var dataTask: URLSessionDataTask?
  var errorMessage = ""
  var moments: [Moment] = []

  typealias MomentResult = ([Moment]?, String) -> Void
  
  func getSearchResults(completion: @escaping MomentResult) {
    dataTask?.cancel()
    if let urlComponents = URLComponents(string: "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith/tweets") {
      guard let url = urlComponents.url else { return }
      dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
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
          self?.updateSearchResults(data)
          DispatchQueue.main.async {
            completion(self?.moments, self?.errorMessage ?? "")
          }
        }
      }
      dataTask?.resume()
    }
  }
  
  func updateSearchResults(_ data: Data) {
    do {
      moments = try JSONDecoder().decode([Moment].self, from: data)
    } catch let decodeError as NSError {
      errorMessage += "JSONDecode error: \(decodeError.localizedDescription)\n"
      return
    }
  }
}
