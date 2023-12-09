//
//  TextFieldComponent.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import SwiftUI

// MARK: - Focus Field Cases

enum FocusedField {
    // signup / login
    case email
    case password, phNumber
    case firstName, lastName, birthDate
    case city, state
    case weight, height
    case gender
    case motive
    case hospitalized
    case allergicReactions
    case heartProblems
    case diabetes, hypertension
    case heartDisease, renalDisease
    case neuroPsychDisease, cancer
    case bleedingDisorder, smoking
    case allergicToMedication
    case allergicToFood
}

// MARK: - TextField Component

struct TextFieldComponent: View {
    // focus state
    @FocusState var focusedField: FocusedField?

    // data binding
    @Binding var text: String

    let placeHolder: String
    let focus: FocusedField
    var isLongPlaceholder: Bool?

    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                // floating placeholder
                Text(placeHolder)
                    .font(.custom(StaticFont.bold, size: 15))
                    .foregroundColor(.accentColor)
                    .offset(y: focusedField == focus || !text.isBlank ? -25 : 0)
                    .scaleEffect(focusedField == focus || !text.isBlank ? 0.9 : 1, anchor: .leading)

                // textfield
                if focus == .password {
                    SecureField("", text: $text)
                        .focused($focusedField, equals: focus)
                        .autocorrectionDisabled()
                        .font(.custom(StaticFont.bold, size: 15))
                        .foregroundColor(Color(StaticColor.greyText))
                } else {
                    TextField("", text: $text)
                        .focused($focusedField, equals: focus)
                        .autocorrectionDisabled()
                        .keyboardType(getKeyboardType())
                        .font(.custom(StaticFont.bold, size: 15))
                        .foregroundColor(Color(StaticColor.greyText))
                        .offset(y: getOffset())
                }
            }
            .padding(.horizontal, 6)

            Rectangle()
                .frame(maxHeight: 1)
        }
        .animation(.easeOut(duration: 0.2), value: focusedField == focus)
    }

    // Method: use numberpad keyboard type
    func getKeyboardType() -> UIKeyboardType {
        switch focus {
        case .email:
            return .emailAddress
        default:
            return .default
        }
    }

    func getOffset() -> CGFloat {
        if isLongPlaceholder == true {
            return 12
        } else {
            return 4
        }
    }
}

struct TextFieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TextFieldComponent(text: .constant("soubhik"), placeHolder: StaticText.smoking, focus: .smoking)

            TextFieldComponent(text: .constant("soubhik"), placeHolder: StaticText.neuroPsychDisease, focus: .smoking, isLongPlaceholder: true)
                .padding(.bottom, 20)
        }
        .padding()
    }
}
