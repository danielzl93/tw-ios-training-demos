//
//  SwipeViewController.swift
//  UIKitDemo
//
//  Created by Liang Zhang on 2020/7/21.
//  Copyright © 2020 Facheng Liang . All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {
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
        
        title = "Swipe"
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
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(responseToSwipeGesture))
        swipeLeft.direction = .left
    
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(responseToSwipeGesture))
        swipeRight.direction = .right
        redBlock.addGestureRecognizer(swipeLeft)
        redBlock.addGestureRecognizer(swipeRight)
    }
    
    @objc func responseToSwipeGesture(swipe: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 1) {
            if (swipe.direction == .left) {
                self.redBlock.frame = CGRect(x: 0, y: self.redBlock.frame.origin.y , width: self.redBlock.frame.size.width, height: self.redBlock.frame.size.height)
            }
            if (swipe.direction == .right) {
                self.redBlock.frame = CGRect(x: self.view.frame.size.width - self.redBlock.frame.size.width, y: self.redBlock.frame.origin.y , width: self.redBlock.frame.size.width, height: self.redBlock.frame.size.height)
            }
        }
    }
}
