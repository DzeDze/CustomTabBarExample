//
//  CustomTabBarItemViewModel.swift
//  CustomTabBar
//
//  Created by Phuc Nguyen on 2024-09-20.
//

import UIKit

struct CustomTabBarItemViewModel {
    let index: Int
    let isSelected: Bool
    let title: String
    let normalIcon: UIImage?
    let selectedIcon: UIImage?
    let normalBackgroundColor: UIColor
    let selectedBackgroundColor: UIColor
}
