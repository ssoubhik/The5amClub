//
//  SignupView.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import SwiftUI

// MARK: - Signup View

struct SignupView: View {
    @AppStorage(StorageKeys.isLoggedIn) var isLoggedIn = false
    @Environment(\.dismiss) var dismiss
    @FocusState var focusedField: FocusedField?
    @State var signupCredentials = SignUpCredentials.new
    @State var medicalHistoryAns = MedicalHistoryAnswers.new
    @State var familyHistoryAns = FamilyHistoryAnswers.new
    @State var allergiesAns = AllergiesAnswers.new
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // signup credential & athlete info section
                SignupCredentialSection(signupCredentials: $signupCredentials)

                // medical history section
                MedicalHistorySection(medicalHistoryAns: $medicalHistoryAns)

                // family history section
                FamilyHistorySection(familyHistoryAns: $familyHistoryAns)

                // allergies section
                AllergiesSection(allergiesAns: $allergiesAns)

                // signup button
                Button {
                    isLoggedIn = true
                } label: {
                    ButtonComponent(title: StaticText.signup)
                }
                .padding()
            }
            .padding(.vertical)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                // login text label
                Button {
                    dismiss()
                } label: {
                    TextComponent(
                        text: StaticText.loginTitle,
                        fontWeight: .bold,
                        fontSize: 16
                    )
                }
            }
        }
    }
}

// MARK: - Signup Form Section Header View

struct SignupFormSectionHeader: View {
    let header: String
    let reason: String
    var body: some View {
        VStack(alignment: .leading) {
            // section header text label
            TextComponent(
                text: header,
                fontWeight: .semibold,
                fontSize: 12
            )

            // section reason text label
            TextComponent(
                text: reason,
                fontSize: 12
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(StaticColor.silver))
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
            .environmentObject(SessionViewModelImpl())
    }
}
