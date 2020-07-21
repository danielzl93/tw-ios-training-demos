//
//  ImageViewComponentViewController.swift
//  UIKitDemo
//
//  Created by Liang Zhang on 2020/7/21.
//  Copyright © 2020 Facheng Liang . All rights reserved.
//

import UIKit

class ImageViewComponentViewController: UIViewController {

    private let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupLayout() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        imageView.layer.borderColor = UIColor.yellow.cgColor
        imageView.layer.borderWidth = 1
        imageView.image = UIImage(named: "cat")
        imageView.clipsToBounds = true
        
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.layer.cornerRadius = 100
    }
}
