//
//  MedicalHistoryAnswers.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import Foundation

struct MedicalHistoryAnswers {
    var hospitalized: String
    var allergicReactions: String
    var heartProblems: String
}

extension MedicalHistoryAnswers {
    static var new: MedicalHistoryAnswers {
        MedicalHistoryAnswers(
            hospitalized: "",
            allergicReactions: "",
            heartProblems: ""
        )
    }
}
