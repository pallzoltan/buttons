//
//  Constants.swift
//  Buttons
//
//  Created by Páll Zoltán on 07/02/2017.
//  Copyright © 2017 Páll Zoltán. All rights reserved.
//

import Foundation
import HexColors

struct Config {

  static let configURL = "https://raw.githubusercontent.com/pallzoltan/buttons/master/config.js"

  static let backgroundColor = UIColor("#ACACAC")
  static let buttonColor = UIColor("#0088FF")

}

enum ButtonType: String {
  case invalid = "invalid"

  case apple = "Apple"
  case google = "Google"
  case yahoo = "Yahoo"
}
