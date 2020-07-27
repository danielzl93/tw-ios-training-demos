//
//  DiscoverTableViewCell.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/23.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {
  
  @IBOutlet weak var icon: UIImageView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var actionImageView: UIImageView!
  
  func config(name: String) {
    self.title.text = name
    self.icon.image = UIImage(named: name)
    self.actionImageView.image = UIImage(named: "action")
  }
  
}
