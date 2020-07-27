//
//  MomentTableViewCell.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/27.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class MomentTableViewCell: UITableViewCell {
  @IBOutlet weak var sender: UILabel!
  @IBOutlet weak var content: UILabel!
  
//  func config(moment: Moment) {
//    self.sender.text = moment.sender?.username
//    self.content.text = moment.content
//  }
}
