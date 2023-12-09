//
//  StringExtension.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import Foundation

// MARK: - String Extension

extension String {
    // check for blank string
    var isBlank: Bool {
      return allSatisfy({ $0.isWhitespace })
    }

    // check valid username
    var isValidUsername: Bool {
        return self.range(of: "\\A\\w{3,18}\\z", options: .regularExpression) != nil
    }

    // check valid email
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }

    // check strong password
    var isStrongPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}").evaluate(with: self)
    }

    // check phone number
    var isValidPhoneNo: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^[0-9+]{0,1}+[0-9]{5,16}$").evaluate(with: self)
    }
}
