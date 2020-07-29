//
//  ViewController.swift
//  POS
//
//  Created by Liang Zhang on 2020/7/27.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
  
  let queryService = QueryService()
  var productsResult: [Product] = []

  @IBOutlet weak var cartButton: UIButton!
  @IBOutlet weak var cleanButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupButtonsUI()
    queryService.getAllItems() { [weak self] (results, error) in
      if let result = results {
        self?.productsResult = result
      }
    }
  }
  
  func setupButtonsUI() {
    for button in [cartButton, cleanButton] {
      guard let button = button else { return }
      button.backgroundColor = .yellow
      button.layer.cornerRadius = 10
      button.layer.borderWidth = 2
      button.layer.borderColor = UIColor.brown.cgColor
      button.contentEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
    }
    
  }

}


