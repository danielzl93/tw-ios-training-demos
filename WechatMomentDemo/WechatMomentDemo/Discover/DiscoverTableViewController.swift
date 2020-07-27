//
//  DiscoverTableViewController.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/24.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class DiscoverTableViewController: UITableViewController {
  let SECTIONFOOTERHEIGHT = 8
  


  private func setupUI() {
    self.tableView.backgroundColor = .cyan
    self.tableView.isScrollEnabled = false
  
    let leftBarButtonItem = UIBarButtonItem(title: "发现", style: .done, target: nil, action: nil)
    leftBarButtonItem.tintColor = .black
    leftBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
    leftBarButtonItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .disabled)
    leftBarButtonItem.isEnabled = false
    navigationItem.leftBarButtonItem = leftBarButtonItem
    
    let searchButton = UIBarButtonItem(image: UIImage(named: "search")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
      , style: .plain, target: nil, action: nil)
    
    let addButton = UIBarButtonItem(image: .add, style: .plain, target: nil, action: nil)
    navigationItem.rightBarButtonItems = [addButton, searchButton]
    navigationItem.backBarButtonItem?.title = " "
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func viewController(for component: String) -> UIViewController? {
    switch component {
    case "Moments":
      return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MomentTableViewController") as! MomentTableViewController
    case "Channels":
      return UIViewController()
    case "Scan":
      return UIViewController()
    case "Shake":
      return UIViewController()
    case "People Nearby":
      return UIViewController()
    case "Games":
      return UIViewController()
    case "Mini Programs":
      return UIViewController()
    default:
      return UIViewController()
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if let componentViewController = viewController(for: discoverList[indexPath.section][indexPath.row]) {
      show(componentViewController, sender: self)
    }
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let view = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: CGFloat(SECTIONFOOTERHEIGHT)))
    view.backgroundColor = .cyan
    return view;
  }
  
  override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return CGFloat(SECTIONFOOTERHEIGHT)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return discoverList.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return discoverList[section].count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverTableViewCell", for: indexPath) as? DiscoverTableViewCell else { return UITableViewCell()
    }
    cell.config(name: discoverList[indexPath.section][indexPath.row])
    return cell
  }
  
}
