//
//  TabBarViewController.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/21.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
   let tabBarItems: KeyValuePairs = ["微信": "wechat", "通讯录": "contacts", "发现": "discover", "我": "wechat"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBarItems()
  }
  
  func setupTabBarItems() {
    guard let controllers = viewControllers else { return }
    var index = 0
    tabBarItems.forEach { (key, value) in
      controllers[index].tabBarItem.title = key
      controllers[index].tabBarItem.image = UIImage(named: value)?.resizeImage(targetSize: CGSize(width: 30, height: 30))
      index += 1
    }
  }
}

extension UIImage {
  
  func resizeImage(targetSize: CGSize) -> UIImage {
    let size = self.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    var newSize: CGSize
    if(widthRatio > heightRatio) {
      newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
      newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
  }
}
