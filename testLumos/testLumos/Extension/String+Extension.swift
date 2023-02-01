//
//  String+Extension.swift
//  testLumos
//
//  Created by sem1 on 1.02.23.
//

import Foundation

extension String {
    
    func getDate() -> String {
        let format1 = DateFormatter()
        format1.dateFormat = "dd MMM HH:mm:ss"
        format1.timeZone = TimeZone(abbreviation: "UTC")
        format1.locale = Locale(identifier: "en_US_POSIX")
        return format1.string(from:Date())
    }
}
