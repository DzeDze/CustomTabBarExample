//
//  CustomTabbarView.swift
//  CustomTabBar
//
//  Created by Phuc Nguyen on 2024-09-20.
//

import UIKit

class CustomTabBarView: UIView {
    
    private let selectedIndex: (Int)->()
    private lazy var stackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .center
        
        return sv
    }()
    
    private var itemsConfiguration: [CustomTabBarItemViewModel]
    private var tabBarItems: [CustomTabBarItem] = []
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 280, height: 50)
    }
    
    init(withConfigurations items: [CustomTabBarItemViewModel], selectedIndex: @escaping (Int)->()) {
        itemsConfiguration = items
        self.selectedIndex = selectedIndex
        super.init(frame: .zero)
        setupTabBar()
        configureUI()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBar() {
        itemsConfiguration.forEach { item in
            let customTabBarItem = CustomTabBarItem(withViewModel: item) { index in
                self.didSelect(index)
            }
            tabBarItems.append(customTabBarItem)
        }
    }
    
    private func configureUI() {
        stackView.addArrangeSubViews(views: tabBarItems)
        self.addSubview(stackView)
        self.backgroundColor = .white
        self.setCornerRadius(25)
        self.addShadow()
    }
    
    private func layout() {
        stackView.fillParent()
    }
    
    private func didSelect(_ index: Int) {
        tabBarItems.forEach { item in
            item.isSelected = item.index == index
        }
        selectedIndex(index)
    }
}
