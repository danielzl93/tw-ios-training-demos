//
//  TextFieldComponentViewController.swift
//  UIKitDemo
//
//  Created by Liang Zhang on 2020/7/21.
//  Copyright © 2020 Facheng Liang . All rights reserved.
//

import UIKit

class TextFieldComponentViewController: UIViewController {

    private let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupLayout() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.heightAnchor.constraint(equalToConstant: 200),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        textField.backgroundColor = .green
        textField.text = "ONLY single line"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
    }
}
