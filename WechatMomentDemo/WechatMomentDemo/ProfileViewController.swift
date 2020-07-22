//
//  ProfileViewController.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/21.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.title = "我"
        let image = UIImage(named: "me")
        self.tabBarItem.image = image?.resizeImage(targetSize: CGSize(width: 30, height: 30))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
