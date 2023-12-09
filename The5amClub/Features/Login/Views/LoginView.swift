//
//  LoginView.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import SwiftUI

// MARK: - Login View

struct LoginView: View {
    @AppStorage(StorageKeys.isLoggedIn) var isLoggedIn = false
    @FocusState var focusedField: FocusedField?
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                // login text label
                TextComponent(
                    text: StaticText.loginTitle,
                    fontWeight: .bold,
                    fontSize: 35
                )

                // email textfield
                TextFieldComponent(
                    focusedField: _focusedField,
                    text: $email,
                    placeHolder: StaticText.emailOrPhNumber,
                    focus: .email
                )

                // password textfield
                TextFieldComponent(
                    focusedField: _focusedField,
                    text: $password,
                    placeHolder: StaticText.password,
                    focus: .password
                )

                // forgot password button
                Button {
                    // action
                } label: {
                    TextComponent(
                        text: StaticText.forgotPassword,
                        fontWeight: .medium,
                        fontSize: 12
                    )
                }

                // login button
                Button {
                    isLoggedIn = true
                } label: {
                    ButtonComponent(title: StaticText.login)
                }
                .padding(.top)

                VStack(alignment: .leading, spacing: 16) {
                    // connect using social accounts text label
                    TextComponent(
                        text: StaticText.connectSocialAccount,
                        fontWeight: .medium,
                        fontSize: 12
                    )

                    // connect with o4p button
                    Button {
                        // action
                    } label: {
                        ButtonComponent(
                            title: StaticText.conncetWithO4p,
                            bgColor: StaticColor.greenLable,
                            fontColor: .white
                        )
                    }

                    // connect with google button
                    Button {
                        // action
                    } label: {
                        ButtonComponent(
                            title: StaticText.connectWithGoogle,
                            bgColor: StaticColor.redLabel,
                            fontColor: .white
                        )
                    }
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                // sign up button: navigate to signup view
                NavigationLink {
                    // signup view
                    SignupView()
                } label: {
                    TextComponent(
                        text: StaticText.signupTitle,
                        fontWeight: .bold,
                        fontSize: 16
                    )
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
