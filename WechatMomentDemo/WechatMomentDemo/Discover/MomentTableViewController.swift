//
//  MomentTableViewController.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/27.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class MomentTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.register(MomentTableViewCell.self, forCellReuseIdentifier: "MomentTableViewCell")
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 1
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MomentTableViewCell", for: indexPath) as? MomentTableViewCell else { return UITableViewCell()
    }
    print(cell)
    cell.sender.text = "as"
    return cell
  }
  
}
