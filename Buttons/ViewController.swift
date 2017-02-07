//
//  ViewController.swift
//  Buttons
//
//  Created by Páll Zoltán on 06/02/2017.
//  Copyright © 2017 Páll Zoltán. All rights reserved.
//

import UIKit
import SnapKit
import Localize_Swift

class ViewController: UIViewController {

  private let activityIndicator: UIActivityIndicatorView

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.activityIndicator = UIActivityIndicatorView()

    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder aDecoder: NSCoder) {
    self.activityIndicator = UIActivityIndicatorView()

    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.addSubview(self.activityIndicator)
    self.activityIndicator.hidesWhenStopped = true
    self.activityIndicator.startAnimating()
    self.activityIndicator.activityIndicatorViewStyle = .gray
    self.activityIndicator.snp.makeConstraints { (make: ConstraintMaker) in
      make.center.equalTo(self.view)
    }

    DataManager.loadConfig(callback: { (data: [ButtonType]?) -> Void in
      if let _data = data {

        let buttonsViewController: ButtonsViewController
        buttonsViewController = ButtonsViewController(types: _data)

        self.present(buttonsViewController, animated: true, completion: nil)

      } else {
        self.showLoadingError()
      }
    })
  }

  private func showLoadingError() {

    let alertController: UIAlertController
    let okAction: UIAlertAction

    alertController = UIAlertController(title: "Error".localized(),
                                        message: "Couldn't load buttons configuration.".localized(),
                                        preferredStyle: .alert)
    okAction = UIAlertAction(title: "OK".localized(),
                             style: .destructive,
                             handler: { (_) in
    })

    alertController.addAction(okAction)

    self.present(alertController, animated: true) {
      self.activityIndicator.stopAnimating()
    }
  }
}
