//
//  ContactsViewController.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/21.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.title = "通讯录"
        let image = UIImage(named: "contacts")
        self.tabBarItem.image = image?.resizeImage(targetSize: CGSize(width: 30, height: 30))
        // Do any additional setup after loading the view.
    }

}
