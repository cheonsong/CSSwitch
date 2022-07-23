//
//  CSSwitch.swift
//  CSSwitch
//
//  Created by cheonsong on 2022/07/19.
//

import Foundation
import UIKit

enum Select {
    case left
    case right
}

public class CSSwitch: UIButton {
    
    // Left: 0, Right: 1
    var selectValue = Select.left
    
    private lazy var selectView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.isUserInteractionEnabled = false
        return stackView
    }()
    
    private lazy var constant: NSLayoutConstraint = {
        let constant = NSLayoutConstraint(item: selectView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
        return constant
    }()
    
    private var selectColor = UIColor.white {
        willSet {
            selectView.backgroundColor = newValue
        }
    }
    
    private var deselectColor = UIColor.clear {
        willSet {
            self.backgroundColor = newValue
        }
    }
    
    private var selectFont = UIFont.systemFont(ofSize: 10) {
        willSet {
            leftLabel.font = newValue
        }
    }
    
    private var deselectFont = UIFont.systemFont(ofSize: 10) {
        willSet {
            rightLabel.font = newValue
        }
    }
    
    private var selectTextColor = UIColor.black {
        willSet {
            leftLabel.textColor = newValue
        }
    }
    
    private var deselectTextColor = UIColor.white {
        willSet {
            rightLabel.textColor = newValue
        }
    }
    
    private var leftLabelText = "left" {
        willSet {
            leftLabel.text = newValue
        }
    }
    
    private var rightLabelText = "right" {
        willSet {
            rightLabel.text = newValue
        }
    }
    
    private var corner = CGFloat(1) {
        willSet {
            self.layer.cornerRadius = newValue
            self.selectView.layer.cornerRadius = newValue
            layoutIfNeeded()
        }
    }
    
    public var selectBorderColor: CGColor {
        get {
            return selectView.layer.borderColor ?? UIColor.clear.cgColor
        }
        
        set {
            selectView.layer.borderColor = newValue
        }
    }
    
    public var selectBorderWidth: CGFloat {
        get {
            return selectView.layer.borderWidth
        }
        
        set {
            selectView.layer.borderWidth = newValue
        }
    }
    
    public var borderColor: CGColor {
        get {
            return self.layer.borderColor ?? UIColor.clear.cgColor
        }
        
        set {
            self.layer.borderColor = newValue
        }
    }
    
    public var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    public var selectedColor: UIColor? {
        get {
            return selectColor
        }
        
        set {
            selectColor = newValue ?? Default.SELECT_COLOR
        }
    }
    
    public var deselectedColor: UIColor? {
        get {
            return deselectColor
        }
        
        set {
            deselectColor = newValue ?? Default.DESELECT_COLOR
        }
    }
    
    public var selectedFont: UIFont {
        get {
            return selectFont
        }
        
        set {
            selectFont = newValue
        }
    }
    
    public var deselectedFont: UIFont {
        get {
            return deselectFont
        }
        
        set {
            deselectFont = newValue
        }
    }
    
    public var selectedTextColor: UIColor {
        get {
            return selectTextColor
        }
        
        set {
            selectTextColor = newValue
        }
    }
    
    public var deselectedTextColor: UIColor {
        get {
            return deselectTextColor
        }
        
        set {
            deselectTextColor = newValue
        }
    }
    
    public var cornerRadius: CGFloat {
        get {
            return corner
        }
        
        set {
            corner = newValue
        }
    }
    
    public var leftText: String {
        get {
            return leftLabelText
        }
        
        set {
            leftLabelText = newValue
        }
    }
    
    public var rightText: String {
        get {
            return rightLabelText
        }
        
        set {
            rightLabelText = newValue
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUI()
        setConstraints()
        
        self.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    private func setUI() {
        isSelected = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        selectView.translatesAutoresizingMaskIntoConstraints = false
        
        selectedColor       = Default.SELECT_COLOR
        deselectedColor     = Default.DESELECT_COLOR
        selectedTextColor   = Default.SELECT_TEXT_COLOR
        deselectedTextColor = Default.DESELECT_TEXT_COLOR
        borderColor         = Default.BORDER_COLOR
        borderWidth         = Default.BORDER_WIDTH
        selectBorderColor   = Default.BORDER_COLOR
        selectBorderWidth   = Default.BORDER_WIDTH
        
        addSubview(selectView)
        addSubview(stackView)
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(rightLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.init(item: stackView,
                                        attribute: .leading,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .leading,
                                        multiplier: 1.0,
                                        constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: stackView,
                                        attribute: .trailing,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .trailing,
                                        multiplier: 1.0,
                                        constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: stackView,
                                        attribute: .top,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .top,
                                        multiplier: 1.0,
                                        constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: stackView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .bottom,
                                        multiplier: 1.0,
                                        constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: selectView,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: stackView,
                                        attribute: .height,
                                        multiplier: 1.0,
                                        constant: 0).isActive = true
        
        NSLayoutConstraint.init(item: selectView,
                                        attribute: .width,
                                        relatedBy: .equal,
                                        toItem: stackView,
                                        attribute: .width,
                                        multiplier: 0.5,
                                        constant: 0).isActive = true
        
        constant.isActive = true
        
    }
    
    @objc private func tap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            if self.selectValue == .left {
                self.constant.constant = self.stackView.frame.width / 2
                self.rightLabel.textColor = self.selectTextColor
                self.leftLabel.textColor = self.deselectTextColor
                self.layoutIfNeeded()
                self.selectValue = .right
            } else {
                self.constant.constant = 0
                self.rightLabel.textColor = self.deselectTextColor
                self.leftLabel.textColor = self.selectTextColor
                self.layoutIfNeeded()
                self.selectValue = .left
            }
        }, completion: nil)
    }
}

private struct Default {
    static let SELECT_COLOR         = UIColor.white
    static let SELECT_TEXT_COLOR    = UIColor.black
    static let DESELECT_COLOR       = UIColor.clear
    static let DESELECT_TEXT_COLOR  = UIColor.lightGray
    static let BORDER_COLOR         = UIColor.lightGray.cgColor
    static let BORDER_WIDTH         = CGFloat(1)
    static let SELECT_BORDER_COLOR  = UIColor.clear.cgColor
    static let SELECT_BORDER_WIDTH  = CGFloat(0)
}
