//
//  HamburgerView.swift
//  The5amClub
//
//  Created by Rhymetech on 26/12/22.
//

import SwiftUI

struct HamburgerView: View {
    let options: [HamburgerOptions] = [.option1, .option2, .option3, .option4, .option5]
    var body: some View {
        ZStack {
            Color(StaticColor.yellowLabel)
                .ignoresSafeArea()

            VStack {
                // 5am club text logo
                Image(StaticImage.the5amclub)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 32)

                // user profile image
                Image("demo-pic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 76, height: 76)
                    .clipShape(Circle())

                // user name
                TextComponent(
                    text: "John",
                    fontWeight: .bold,
                    fontSize: 20
                )

                // view profile button
                Button {
                    // action
                } label: {
                    TextComponent(text: "View profile")
                }

                Divider()
                    .padding(.vertical)

                // hamburger options
                ForEach(options) { option in
                    HamburgerListRow(option: option)
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct HamburgerView_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerView()
            .environmentObject(SessionViewModelImpl())
    }
}

struct HamburgerListRow: View {
    let option: HamburgerOptions
    var body: some View {
        HStack(spacing: 0) {
            Image(option.icon)
                .padding(.trailing)

            if option.title == HamburgerOptions.option3.title {
                Image(StaticImage.the5amclub)
                    .padding(.trailing, 8)
            }

            TextComponent(
                text: option.title,
                fontSize: 16
            )

            Spacer()
        }
    }
}
