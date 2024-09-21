//
//  Extensions.swift
//  CustomTabBar
//
//  Created by Phuc Nguyen on 2024-09-20.
//

import UIKit

extension UIView {
    func addSubViews(views: UIView...) {
        views.forEach { subview in
            self.addSubview(subview)
        }
    }
    
    func setCornerRadius(_ cornerRadius: CGFloat = 0, maskedCorners: CACornerMask? = nil) {
        layer.cornerRadius = cornerRadius
        if let maskedCorners = maskedCorners {
            layer.maskedCorners = maskedCorners
        }
    }
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 3
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil,
                topMultiplier: CGFloat = 0, leadingMultiplier: CGFloat = 0,
                bottomMultiplier: CGFloat = 0, trailingMultiplier: CGFloat = 0,
                width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalToSystemSpacingBelow: top, multiplier: topMultiplier).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalToSystemSpacingAfter: leading, multiplier: leadingMultiplier).isActive = true
        }
        
        if let bottom = bottom {
            bottom.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: bottomMultiplier).isActive = true
        }
        
        if let trailing = trailing {
            trailing.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: trailingMultiplier).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }

    func centeredInParent() {
        if let parent = self.superview {
            translatesAutoresizingMaskIntoConstraints = false
            centerX(inView: parent)
            centerY(inView: parent)
        }
    }

    func fillParent() {
        if let parent = self.superview {
            translatesAutoresizingMaskIntoConstraints = false
            topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
            trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
        }
    }

    func paddingHorizontalEquallyInParent(multiplier: CGFloat = 0) {
        if let parent = self.superview {
            translatesAutoresizingMaskIntoConstraints = false
            leadingAnchor.constraint(equalToSystemSpacingAfter: parent.leadingAnchor, multiplier: multiplier).isActive = true
            parent.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: multiplier).isActive = true
        }
    }

    func paddingVerticalEquallyInParent(multiplier: CGFloat = 0) {
        if let parent = self.superview {
            translatesAutoresizingMaskIntoConstraints = false
            topAnchor.constraint(equalToSystemSpacingBelow: parent.topAnchor, multiplier: multiplier).isActive = true
            parent.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: multiplier).isActive = true
        }
    }

    func paddingEquallyInParent(multiplier: CGFloat = 0) {
        
        paddingHorizontalEquallyInParent(multiplier: multiplier)
        paddingVerticalEquallyInParent(multiplier: multiplier)
        
    }

    func centerXInParent(topPaddingMultiplier topPaddingMul: CGFloat = 0) {
        if let parent = self.superview {
            centerX(inView: parent)
            topAnchor.constraint(equalToSystemSpacingBelow: parent.topAnchor, multiplier: topPaddingMul).isActive = true
        }
    }

    func centerYInParent(leadingPaddingMultiplier leadingPaddingMul: CGFloat = 0) {
        if let parent = self.superview {
            centerY(inView: parent)
            leadingAnchor.constraint(equalToSystemSpacingAfter: parent.leadingAnchor, multiplier: leadingPaddingMul).isActive = true
        }
    }
    
    func setDimensions(width: CGFloat = 0, height: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

extension UIStackView {
    func addArrangeSubViews(views: [UIView]) {
        views.forEach { subview in
            self.addArrangedSubview(subview)
        }
    }
}


