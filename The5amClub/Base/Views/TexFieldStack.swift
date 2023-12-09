//
//  TexFieldStack.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import SwiftUI

// MARK: - TextField Stack View

struct TextFieldStack: View {
    @FocusState var focusedField: FocusedField?

    @Binding var text1: String
    @Binding var text2: String

    let placeholder1: String
    let placeholder2: String
    let focus1: FocusedField
    let focus2: FocusedField
    var isLongPlaceholder1: Bool?
    var isLongPlaceholder2: Bool?

    var body: some View {
        HStack(spacing: 16) {
            // first name textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $text1,
                placeHolder: placeholder1,
                focus: focus1,
                isLongPlaceholder: isLongPlaceholder1
            )
            .padding(.bottom, isLongPlaceholder1 == true ? 20 : 0)

            // last name textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $text2,
                placeHolder: placeholder2,
                focus: focus2,
                isLongPlaceholder: isLongPlaceholder2
            )
            .padding(.bottom, isLongPlaceholder2 == true ? 20 : 0)
        }
    }
}
