//
//  CustomTabBarItem.swift
//  CustomTabBar
//
//  Created by Phuc Nguyen on 2024-09-20.
//

import UIKit

let selectedBGColor = UIColor.systemPink
let normalBGColor = UIColor.white
let selectedTextColor = UIColor.white
let normalTextColor = UIColor.black

class CustomTabBarItem: UIView {
    let model: CustomTabBarItemViewModel
    let index: Int
    let callback: (Int)->()
    private lazy var containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = selectedTextColor
        label.textAlignment = .left
        label.text = model.title
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.spacing = 8
        return sv
    }()
    
    var isSelected: Bool = false {
        didSet {
            animate()
        }
    }
    
    init(withViewModel model: CustomTabBarItemViewModel, callback: @escaping (Int)->()) {
        
        self.model = model
        self.index = model.index
        self.callback = callback
        
        super.init(frame: .zero)
        
        isSelected = model.isSelected
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(didTapped))
        self.addGestureRecognizer(tabGesture)
        
        configureUI()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 140, height: 50)
    }
    
    private func configureUI() {
        
        backgroundColor = .clear
        
        containerView.backgroundColor = isSelected ? model.selectedBackgroundColor : model.normalBackgroundColor
        iconView.image = isSelected ? model.selectedIcon : model.normalIcon
        titleView.textColor = isSelected ? selectedTextColor : normalTextColor
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangeSubViews(views: [iconView, titleView])
        containerView.addSubview(stackView)
        
        containerView.setCornerRadius(16)
        
        addSubview(containerView)
    }
    
    private func layout() {
        containerView.paddingEquallyInParent(multiplier: 1/1.5)
        iconView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        stackView.centeredInParent()
        
    }
    
    private func animate() {
        
        UIView.transition(with: iconView,
                          duration: 0.4,
                          options: .transitionCrossDissolve) { [unowned self] in
            containerView.backgroundColor = isSelected ? model.selectedBackgroundColor : model.normalBackgroundColor
            iconView.image = isSelected ? model.selectedIcon : model.normalIcon
            titleView.textColor = isSelected ? selectedTextColor : normalTextColor
        }
        
    }
    
    @objc private func didTapped() {
        callback(self.index)
    }
}
