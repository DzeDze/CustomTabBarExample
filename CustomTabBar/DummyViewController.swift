//
//  DummyViewController.swift
//  SpendingMap
//
//  Created by Phuc Nguyen on 2024-09-18.
//

import UIKit

class DummyViewController: UIViewController {
    let backgroundColor: UIColor
    let welcomeMessage: String
    let stackView = UIStackView()
    let welcomeLbl = UILabel()
    
    init(with backgroundColor: UIColor, and welcomeMessage: String) {
        self.backgroundColor = backgroundColor
        self.welcomeMessage = welcomeMessage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Sorry init(coder:) has never been implemented. ;)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        style()
        layout()
    }
    
    private func configureUI() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        
        welcomeLbl.text = welcomeMessage
        welcomeLbl.textAlignment = .center
        welcomeLbl.numberOfLines = 0
        welcomeLbl.font = .preferredFont(forTextStyle: .body)
        welcomeLbl.adjustsFontForContentSizeCategory = true
        welcomeLbl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func style() {
        view.backgroundColor = self.backgroundColor
        
    }
    
    private func layout() {
        stackView.addArrangedSubview(welcomeLbl)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
}

