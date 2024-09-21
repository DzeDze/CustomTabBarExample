//
//  ViewController.swift
//  CustomTabBar
//
//  Created by Phuc Nguyen on 2024-09-19.
//

import UIKit

class ViewController: UITabBarController {
    private lazy var label: UILabel = {
       let lb = UILabel()
        lb.text = "Everything's good"
        lb.textAlignment = .center
        lb.textColor = .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private var tabBarView: CustomTabBarView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureUI()
        layout()
    }

    private func configureUI() {
        
        tabBar.isHidden = true
        self.selectedIndex = 0
        
        let cartImageSelected = UIImage(systemName: "cart")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let cartImageNormal = UIImage(systemName: "cart")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let dollarImageSelected = UIImage(systemName: "dollarsign")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let dollarImageNormal = UIImage(systemName: "dollarsign")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        let item1 = CustomTabBarItemViewModel(index: 0, isSelected: true, title: "Expense", normalIcon: cartImageNormal, selectedIcon: cartImageSelected, normalBackgroundColor: .white, selectedBackgroundColor: .systemPink)
        
        let item2 = CustomTabBarItemViewModel(index: 1, isSelected: false, title: "Income", normalIcon: dollarImageNormal, selectedIcon: dollarImageSelected, normalBackgroundColor: .white, selectedBackgroundColor: .systemPink)
        
        tabBarView = CustomTabBarView(withConfigurations: [item1, item2], selectedIndex: { [weak self] index in
            self?.selected(index)
        })
        
        if let tabBar = tabBarView {
            view.addSubview(tabBar)
        }
    }
    
    private func layout() {
        
        if let tabBar = tabBarView {
            tabBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, topMultiplier: 12, leadingMultiplier: 3, trailingMultiplier: 3)
        }
    }
    
    private func selected(_ index: Int) {
        self.selectedIndex = index
    }
}

