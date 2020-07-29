//
//  Product.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/28.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation

struct Product: Codable{
  let barcode: String
  let name: String
  let unit: String
  let price: Double
  var isPromoted: Bool?
  var count: Int?
}
