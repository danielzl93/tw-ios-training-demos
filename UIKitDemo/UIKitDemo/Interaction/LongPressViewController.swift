//
//  LongPressViewController.swift
//  UIKitDemo
//
//  Created by Liang Zhang on 2020/7/21.
//  Copyright © 2020 Facheng Liang . All rights reserved.
//

import UIKit

class LongPressViewController: UIViewController {

    private let redBlock = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupUI()
            // Do any additional setup after loading the view.
    }
        

    private func setupLayout() {
       view.addSubview(redBlock)
       redBlock.translatesAutoresizingMaskIntoConstraints = false
          
       title = "long press: hope your finger well"
       redBlock.backgroundColor = .red
       NSLayoutConstraint.activate([
           redBlock.widthAnchor.constraint(equalToConstant: 200),
           redBlock.heightAnchor.constraint(equalToConstant: 200),
           redBlock.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           redBlock.centerYAnchor.constraint(equalTo: view.centerYAnchor)
       ])
    }
      
    private func setupUI() {
       view.backgroundColor = .white
       redBlock.isUserInteractionEnabled = true
       
       let rotate = UILongPressGestureRecognizer(target: self, action: #selector(responseToLongPressGesture))
       redBlock.addGestureRecognizer(rotate)
    
    }
    
    @objc func responseToLongPressGesture(rotate: UILongPressGestureRecognizer) {
        redBlock.backgroundColor = .gray
    }
}
