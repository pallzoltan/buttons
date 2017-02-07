//
//  CustomButton.swift
//  Buttons
//
//  Created by Páll Zoltán on 07/02/2017.
//  Copyright © 2017 Páll Zoltán. All rights reserved.
//

import Foundation
import UIKit
import HexColors
import SnapKit

class CustomButtonView: UIView {

  fileprivate let label: UILabel
  fileprivate let button: UIButton

  public var tapCallback: ((ButtonType) -> Void)?
  fileprivate var type: ButtonType {
    didSet {
      self.setUpUI()
    }
  }

  override var intrinsicContentSize: CGSize {
    return CGSize(width: 150, height: 100)
  }

  init() {
    self.label = UILabel()
    self.button = UIButton()
    self.type = .invalid

    super.init(frame: .zero)

    self.button.addTarget(self, action: #selector(self.onTap), for: .touchUpInside)

    self.setUpUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("CustomButtonView must be initialized with init(type:)")
  }

  @objc private func onTap() {
    if let _tapCallback = self.tapCallback {
      _tapCallback(self.type)
    }
  }

  fileprivate func setUpUI() {

    self.backgroundColor = .white
    
    self.layer.shadowOpacity = 0.2
    self.layer.shadowRadius = 10
    self.layer.shadowOffset = CGSize(width: 10, height: 10)

    self.addSubview(self.label)
    self.addSubview(self.button)

    self.label.text = "Custom"

    self.button.backgroundColor = Config.buttonColor
    self.button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    self.button.layer.cornerRadius = 2
    self.button.setTitle("Button", for: .normal)
    self.button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

    self.label.snp.makeConstraints { (make: ConstraintMaker) in
      make.centerX.equalTo(self)
      make.top.equalTo(self).offset(10)
    }

    self.button.snp.makeConstraints { (make: ConstraintMaker) in
      make.centerX.equalTo(self)
      make.bottom.equalTo(self).offset(-10)
    }

  }
}

class AppleButtonView: CustomButtonView {

  override var intrinsicContentSize: CGSize {
    return CGSize(width: 150, height: 100)
  }

  override init() {
    super.init()

    self.type = .apple
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override fileprivate func setUpUI() {

    super.setUpUI()

    self.label.font = UIFont.boldSystemFont(ofSize: 14)
    self.label.text = self.type.rawValue

    self.label.snp.remakeConstraints { (make: ConstraintMaker) in
      make.centerX.equalTo(self)
      make.top.equalTo(self).offset(10)
    }

    self.button.snp.remakeConstraints { (make: ConstraintMaker) in
      make.centerX.equalTo(self)
      make.top.equalTo(self.label.snp.bottom).offset(10)
      make.bottom.equalTo(self).offset(-10)
    }

  }
}

class GoogleButtonView: CustomButtonView {

  override var intrinsicContentSize: CGSize {
    return CGSize(width: 150, height: 50)
  }

  override init() {
    super.init()

    self.type = .google
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override fileprivate func setUpUI() {

    super.setUpUI()

    self.label.font = UIFont.systemFont(ofSize: 12)
    self.label.text = self.type.rawValue

    self.label.snp.remakeConstraints { (make: ConstraintMaker) in
      make.leading.equalTo(self).offset(10)
      make.top.equalTo(self).offset(10)
      make.bottom.equalTo(self).offset(-10)
    }

    self.button.snp.remakeConstraints { (make: ConstraintMaker) in
      make.trailing.equalTo(self).offset(-10)
      make.top.equalTo(self).offset(10)
      make.bottom.equalTo(self).offset(-10)
    }

  }
}

class YahooButtonView: CustomButtonView {

  override var intrinsicContentSize: CGSize {
    return CGSize(width: 150, height: 50)
  }

  override init() {
    super.init()

    self.type = .yahoo
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override fileprivate func setUpUI() {

    super.setUpUI()

    self.label.font = UIFont.boldSystemFont(ofSize: 14)
    self.label.text = self.type.rawValue

    self.label.snp.remakeConstraints { (make: ConstraintMaker) in
      make.trailing.equalTo(self).offset(-10)
      make.top.equalTo(self).offset(10)
      make.bottom.equalTo(self).offset(-10)
    }

    self.button.snp.remakeConstraints { (make: ConstraintMaker) in
      make.leading.equalTo(self).offset(10)
      make.top.equalTo(self).offset(10)
      make.bottom.equalTo(self).offset(-10)
    }

  }
}
