//
//  PanViewController.swift
//  UIKitDemo
//
//  Created by Liang Zhang on 2020/7/21.
//  Copyright © 2020 Facheng Liang . All rights reserved.
//

import UIKit

class PanViewController: UIViewController {
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
        
        title = "Pan: trace your finger movement"
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
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(responseToPanGesture))
        redBlock.addGestureRecognizer(pan)
        
    }
    
    @objc func responseToPanGesture(pan: UIPanGestureRecognizer) {
        
        let translation = pan.translation(in: self.redBlock)

        self.redBlock.center.x += translation.x
        self.redBlock.center.y += translation.y

        pan.setTranslation(CGPoint(x: 0, y: 0), in: self.redBlock)
    }

}
