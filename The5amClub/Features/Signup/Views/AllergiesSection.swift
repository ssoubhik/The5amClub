//
//  AllergiesSection.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI

// MARK: - Allergies Section View

struct AllergiesSection: View {
    @FocusState var focusedField: FocusedField?
    @Binding var allergiesAns: AllergiesAnswers
    var body: some View {
        // allergies section header
        SignupFormSectionHeader(
            header: StaticText.allergies,
            reason: StaticText.familyHistoryReason
        )

        Group {
            // allergic to medication textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $allergiesAns.allergicToMedication,
                placeHolder: StaticText.allergicToMedication,
                focus: .allergicToMedication
            )

            // allergic to food textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $allergiesAns.allergicToFood,
                placeHolder: StaticText.allergicToFood,
                focus: .allergicToFood
            )
        }
        .padding(.horizontal)
    }
}
