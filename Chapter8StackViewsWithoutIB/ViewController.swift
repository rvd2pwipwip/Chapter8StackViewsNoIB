//
//  ViewController.swift
//  Chapter8StackViewsWithoutIB
//
//  Created by Herve Desrosiers on 2020-03-10.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum ViewMetrics {
        static let fontSize: CGFloat = 24
        static let spacing: CGFloat = 12
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(rootStackView)
        NSLayoutConstraint.activate([
            rootStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rootStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private let colorLabel: UILabel = {
        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pick a Color"
        label.font = .systemFont(ofSize: ViewMetrics.fontSize)
        return label
    }()
    private let redButton = UIButton.customButton(title: "Red", color: .red, fontSize: ViewMetrics.fontSize)
    private let greenButton = UIButton.customButton(title: "Green", color: .green, fontSize: ViewMetrics.fontSize)
    private let blueButton = UIButton.customButton(title: "Blue", color: .blue, fontSize: ViewMetrics.fontSize)
    
    // lazy property so the button properties can be accessed after the view controller is initialized
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = ViewMetrics.spacing
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [colorLabel, buttonStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = ViewMetrics.spacing
        return stackView
    }()
}

extension UIButton {
    static func customButton(title: String, color: UIColor, fontSize: CGFloat) -> UIButton {
        let button = UIButton(type: .custom)
//        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: fontSize)
        return button
    }
}

