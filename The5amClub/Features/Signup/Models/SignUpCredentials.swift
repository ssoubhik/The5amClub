//
//  SignUpCredentials.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import Foundation

struct SignUpCredentials {
    var firstName, lastName, birthDate: String
    var city, state: String
    var email, phNumber, password: String
    var weight, height: String
    var gender: String
    var motive: String
}

extension SignUpCredentials {
    static var new: SignUpCredentials {
        SignUpCredentials(
            firstName: "",
            lastName: "",
            birthDate: "",
            city: "",
            state: "",
            email: "",
            phNumber: "",
            password: "",
            weight: "",
            height: "",
            gender: "",
            motive: ""
        )
    }
}
