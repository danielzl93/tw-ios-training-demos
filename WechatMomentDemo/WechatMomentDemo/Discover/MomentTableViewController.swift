//
//  MomentTableViewController.swift
//  WechatMomentDemo
//
//  Created by Liang Zhang on 2020/7/27.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class MomentTableViewController: UITableViewController {
  let momentRequest = MomentRequest()
  var momentResult: [Moment] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.estimatedRowHeight = 600
    tableView.rowHeight = UITableView.automaticDimension
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(false)
    momentRequest.getSearchResults { [weak self] (results, error) in
      if let result = results {
        self?.momentResult = result
        self?.tableView.reloadData()
      }
    }
    
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return momentResult.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MomentTableViewCell", for: indexPath) as? MomentTableViewCell else { return UITableViewCell()
    }
    cell.config(moment: momentResult[indexPath.row])
    return cell
  }
  
}
