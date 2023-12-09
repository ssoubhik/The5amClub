//
//  FamilyHistorySection.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI

// MARK: - Family History Section View

struct FamilyHistorySection: View {
    @FocusState var focusedField: FocusedField?
    @Binding var familyHistoryAns: FamilyHistoryAnswers
    var body: some View {
        // family history section header
        SignupFormSectionHeader(
            header: StaticText.familyHistory,
            reason: StaticText.familyHistoryReason
        )

        Group {
            // diabetes & hypertension textfield
            TextFieldStack(
                text1: $familyHistoryAns.diabetes,
                text2: $familyHistoryAns.hypertension,
                placeholder1: StaticText.diabetes,
                placeholder2: StaticText.hypertension,
                focus1: .diabetes,
                focus2: .hypertension
            )

            // heart diseases & renal diseases textfield
            TextFieldStack(
                text1: $familyHistoryAns.heartDisease,
                text2: $familyHistoryAns.renalDisease,
                placeholder1: StaticText.heartDisease,
                placeholder2: StaticText.renalDisease,
                focus1: .heartDisease,
                focus2: .renalDisease
            )

            // neuro psych diseases & cancer textfield
            TextFieldStack(
                text1: $familyHistoryAns.neuroPsychDisease,
                text2: $familyHistoryAns.cancer,
                placeholder1: StaticText.neuroPsychDisease,
                placeholder2: StaticText.cancer,
                focus1: .neuroPsychDisease,
                focus2: .cancer,
                isLongPlaceholder1: true
            )

            // bleeding disorder & smoking textfield
            TextFieldStack(
                text1: $familyHistoryAns.bleedingDisorder,
                text2: $familyHistoryAns.smoking,
                placeholder1: StaticText.bleedingDisorder,
                placeholder2: StaticText.smoking,
                focus1: .bleedingDisorder,
                focus2: .smoking
            )
        }
        .padding(.horizontal)
    }
}
