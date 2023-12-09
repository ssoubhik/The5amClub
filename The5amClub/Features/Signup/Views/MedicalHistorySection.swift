//
//  MedicalHistorySection.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI

// MARK: - Medical History Section View

struct MedicalHistorySection: View {
    @FocusState var focusedField: FocusedField?
    @Binding var medicalHistoryAns: MedicalHistoryAnswers
    var body: some View {
        // athelete section header
        SignupFormSectionHeader(
            header: StaticText.medicalHistory,
            reason: StaticText.medicalHistoryReason
        )

        Group {
            // ever hospitalized textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $medicalHistoryAns.hospitalized,
                placeHolder: StaticText.hospitalized,
                focus: .hospitalized,
                isLongPlaceholder: true
            )

            // any allergic reactions textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $medicalHistoryAns.allergicReactions,
                placeHolder: StaticText.anyAllergicRecation,
                focus: .allergicReactions,
                isLongPlaceholder: true
            )

            // any heart problems textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $medicalHistoryAns.heartProblems,
                placeHolder: StaticText.anyHeartProblem,
                focus: .heartProblems,
                isLongPlaceholder: true
            )
        }
        .padding(.horizontal)
    }
}
