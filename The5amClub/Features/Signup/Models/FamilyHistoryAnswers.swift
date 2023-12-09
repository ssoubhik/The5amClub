//
//  FamilyHistoryAnswers.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import Foundation

struct FamilyHistoryAnswers {
    var diabetes, hypertension: String
    var heartDisease, renalDisease: String
    var neuroPsychDisease, cancer: String
    var bleedingDisorder, smoking: String
}

extension FamilyHistoryAnswers {
    static var new: FamilyHistoryAnswers {
        FamilyHistoryAnswers(
            diabetes: "",
            hypertension: "",
            heartDisease: "",
            renalDisease: "",
            neuroPsychDisease: "",
            cancer: "",
            bleedingDisorder: "",
            smoking: ""
        )
    }
}
