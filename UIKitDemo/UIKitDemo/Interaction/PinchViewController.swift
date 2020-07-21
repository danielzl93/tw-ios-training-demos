//
//  PinchViewController.swift
//  UIKitDemo
//
//  Created by Liang Zhang on 2020/7/21.
//  Copyright © 2020 Facheng Liang . All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

    private var redBlock = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupUI()
        // Do any additional setup after loading the view.
    }
    

    private func setupLayout() {
        view.addSubview(redBlock)
        redBlock.translatesAutoresizingMaskIntoConstraints = false
           
        title = "pinch: try to zoom in/out"
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
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(responseToPanGesture))
        redBlock.addGestureRecognizer(pinch)
    }
    
    @objc func responseToPanGesture(pinch: UIPinchGestureRecognizer) {
        let scale = pinch.scale

        redBlock.transform = redBlock.transform.scaledBy(x: scale, y: scale)

        pinch.scale = 1.0
    }
    
}
