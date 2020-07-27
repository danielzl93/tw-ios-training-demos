//
//  model.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/26.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation

struct Moment: Codable {
  var content: String?
  var images: [Images]?
  var sender: Sender?
  var comments: [Comment]?
  var error: String?
  var unknownError: String?
  
  enum CodingKeys : String, CodingKey {
    case unknownError = "unknown error"
    case content
    case images
    case sender
    case comments
    case error
  }
}

struct Images: Codable {
  var url: String
}

struct Sender: Codable {
  var username: String
  var nick: String
  var avatar: String
}

struct Comment: Codable {
  var content: String
  var sender: Sender
}

