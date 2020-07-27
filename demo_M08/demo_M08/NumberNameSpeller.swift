//
//  NumberNameSpeller.swift
//  demo_M08
//
//  Created by Xin Guo on 2019/11/20.
//  Copyright © 2019 personal.emagrorrim. All rights reserved.
//

import Foundation

struct NumberNameSpeller {
  static let one : [String] = ["", "one ", "two ", "three ", "four ",
                        "five ", "six ", "seven ", "eight ",
                        "nine ", "ten ", "eleven ", "twelve ",
                        "thirteen ", "fourteen ", "fifteen ",
                        "sixteen ", "seventeen ", "eighteen ",
                        "nineteen "]
  static let ten : [String] = ["", "", "twenty ", "thirty ", "forty ",
                        "fifty ", "sixty ", "seventy ", "eighty ",
                        "ninety "]
  
  static func numberName(of number: Int) -> String {
    if number < 0 {
      return "negative Number!"
    }
    
    var result = "";
    result += numToWords(n: (number / 100000) % 100, s: "million, ")
    result += numToWords(n: (number / 1000) % 100, s: "thousand, ")
    result += numToWords(n: (number / 100) % 10, s: "hundred ")
    
    if (number > 100 && number % 100 > 0) {
      result += "and ";
    }
    result += numToWords(n: number % 100, s: "");
    
    return result;
  }
  
  static func numToWords(n: Int, s: String) -> String {
    var str = ""
    if (n > 19) {
      str += ten[n / 10] + one[n % 10];
    } else {
      str += one[n];
    }
    if (n != 0) {
      str += s;
    }
    return str;
  }
}
