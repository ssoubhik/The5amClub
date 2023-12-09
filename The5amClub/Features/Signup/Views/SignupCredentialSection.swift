//
//  SignupCredentialSection.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI

// MARK: - Signup Credentials Section View

struct SignupCredentialSection: View {
    @FocusState var focusedField: FocusedField?
    @Binding var signupCredentials: SignUpCredentials
    var body: some View {
        Group {
            // sign up title
            TextComponent(
                text: StaticText.signupTitle,
                fontWeight: .bold,
                fontSize: 35
            )

            // first name & last name textfield
            TextFieldStack(
                text1: $signupCredentials.firstName,
                text2: $signupCredentials.lastName,
                placeholder1: StaticText.firstName,
                placeholder2: StaticText.lastName,
                focus1: .firstName,
                focus2: .lastName
            )

            // city & state textfield
            TextFieldStack(
                text1: $signupCredentials.city,
                text2: $signupCredentials.state,
                placeholder1: StaticText.city,
                placeholder2: StaticText.state,
                focus1: .city,
                focus2: .state
            )

            // email textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $signupCredentials.email,
                placeHolder: StaticText.email,
                focus: .email
            )

            // phone number textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $signupCredentials.phNumber,
                placeHolder: StaticText.phNumber,
                focus: .phNumber
            )

            // password textfield
            TextFieldComponent(
                focusedField: _focusedField,
                text: $signupCredentials.password,
                placeHolder: StaticText.password,
                focus: .password
            )
        }
        .padding(.horizontal)

        VStack(spacing: 0) {
            // athelete section header
            SignupFormSectionHeader(
                header: StaticText.athleteInfo,
                reason: StaticText.athleteInfoReason
            )

            // update using google fit
            HStack {
                // heart icon
                Image(systemName: StaticImage.heart)
                    .font(.title3)

                // text label
                TextComponent(text: StaticText.updateUsingGoogleFit)

                Spacer()

                // chevron right icon
                Image(systemName: StaticImage.chevronRight)
            }
            .padding()
            .background(Color(StaticColor.greyText).opacity(0.3))
        }

        Group {
            // birth date field
            DateFieldComponent(
                date: $signupCredentials.birthDate,
                placeHolder: StaticText.birthDate
            )

            // gender & weight textfield
            TextFieldStack(
                text1: $signupCredentials.gender,
                text2: $signupCredentials.weight,
                placeholder1: StaticText.gender,
                placeholder2: StaticText.weight,
                focus1: .gender,
                focus2: .weight
            )

            // height & motive textfield
            TextFieldStack(
                text1: $signupCredentials.height,
                text2: $signupCredentials.motive,
                placeholder1: StaticText.height,
                placeholder2: StaticText.motive,
                focus1: .height,
                focus2: .motive
            )
        }
        .padding(.horizontal)
    }
}
