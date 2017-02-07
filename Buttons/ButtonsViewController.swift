//
//  ButtonsViewController.swift
//  Buttons
//
//  Created by Páll Zoltán on 07/02/2017.
//  Copyright © 2017 Páll Zoltán. All rights reserved.
//

import Foundation
import SnapKit

class ButtonsViewController: ViewController {

  private let buttonTypes: [ButtonType]
  private let stackView: UIStackView

  init(types: [ButtonType]) {

    self.buttonTypes = types
    self.stackView = UIStackView()

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {

    self.view.backgroundColor = Config.backgroundColor

    self.view.addSubview(self.stackView)
    self.stackView.axis = .vertical
    self.stackView.spacing = 30
    self.stackView.alignment = .center
    self.stackView.distribution = .equalSpacing
    self.stackView.snp.makeConstraints { (make: ConstraintMaker) in
      make.center.equalTo(self.view)
    }

    var buttonView: CustomButtonView

    for _buttonType in self.buttonTypes {

      switch _buttonType {
      case .apple:
        buttonView = AppleButtonView()
        break
      case .google:
        buttonView = GoogleButtonView()
        break
      case .yahoo:
        buttonView = YahooButtonView()
        break
      default:
        buttonView = CustomButtonView()
        break
      }

      buttonView.tapCallback = self.showAlert

      stackView.addArrangedSubview(buttonView)
    }
  }

  func showAlert(type: ButtonType) {

    let alertController: UIAlertController
    let okAction: UIAlertAction
    let message: String

    message = "You just tapped: ".localized().appending(type.rawValue)

    alertController = UIAlertController(title: "Hello".localized(), message: message, preferredStyle: .alert)

    okAction = UIAlertAction(title: "OK".localized(), style: .default, handler: { (_) in
      alertController.dismiss(animated: true, completion: nil)
    })
    alertController.addAction(okAction)

    self.present(alertController, animated: true, completion: nil)
  }

}
