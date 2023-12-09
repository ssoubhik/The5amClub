//
//  AllergiesAnswers.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import Foundation

struct AllergiesAnswers {
    var allergicToMedication: String
    var allergicToFood: String
}

extension AllergiesAnswers {
    static var new: AllergiesAnswers {
        AllergiesAnswers(
            allergicToMedication: "",
            allergicToFood: ""
        )
    }
}
