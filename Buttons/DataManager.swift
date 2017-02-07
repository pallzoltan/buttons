//
//  DataManager.swift
//  Buttons
//
//  Created by Páll Zoltán on 07/02/2017.
//  Copyright © 2017 Páll Zoltán. All rights reserved.
//

import Foundation
import Alamofire

class DataManager: AnyObject {

  static public func loadConfig(callback: @escaping ([ButtonType]?) -> Void) {
    Alamofire.request(Config.configURL).responseJSON { (response: DataResponse<Any>) in
      if let _value = response.result.value as? [String: AnyObject],
        let _data = _value["buttons"] as? [String] {

        let parsedData: [ButtonType]
        parsedData = parseResponse(data: _data)
        callback(parsedData)

      } else {
        callback(nil)
      }
    }
  }

  static private func parseResponse(data: [String]) -> [ButtonType] {

    let parsedData: [ButtonType]

    parsedData = data.map({ (string: String) -> ButtonType in
      guard let _value = ButtonType(rawValue: string) else {
        return .invalid
      }

      return _value

    }).filter({ (type: ButtonType) -> Bool in
      return type != .invalid
    })

    return parsedData

    // Test how CustomButton works
//    var n = parsedData
//    n.append(.invalid)
//    
//    return n
  }
}
