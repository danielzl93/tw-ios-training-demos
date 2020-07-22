//
//  DevicesViewController.swift
//  UITableViewDemo
//
//  Created by Facheng Liang  on 2019/11/19.
//  Copyright © 2019 Facheng Liang . All rights reserved.
//

import UIKit

class DevicesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    /*
   Implement the `DevicesViewController`
   Acceptance criteria:
   - has a header view above first `Android` or `iOS` device. the header view contains a label, the label text will be the platform name.
   - display name, system and available status in each device cell.
   */

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 70
  }
}

extension DevicesViewController: UITableViewDelegate {
    
}

extension DevicesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return deviceList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceList[section].devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell", for: indexPath) as? DevicesCell else { return UITableViewCell()
        }
        cell.configure(with: deviceList[indexPath.section].devices[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return deviceList[section].platform.rawValue
    }
}
