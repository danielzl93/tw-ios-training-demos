//
//  DevicesView.swift
//  UITableViewDemo
//
//  Created by Liang Zhang on 2020/7/22.
//  Copyright © 2020 Facheng Liang . All rights reserved.
//

import UIKit

class DevicesCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var systemLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func configure(with device: Deveice) {
        nameLabel.text = device.name
        systemLabel.text = device.system
        statusLabel.text = String(device.isAvailable)
    }

}
