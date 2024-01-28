//
//  UtilsCurrConv.swift
//  TAMU-HACK-X
//
//  Created by Hai Yen Nguyen on 1/27/24.
//

import Foundation

extension String {
    static let numberFormat = NumberFormatter()
    var doubleVal: Double {
        String.numberFormat.decimalSeparator = "."
        if let result = String.numberFormat.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormat.decimalSeparator = ","
            if let result = String.numberFormat.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}
