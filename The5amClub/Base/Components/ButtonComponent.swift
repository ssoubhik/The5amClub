//
//  ButtonComponent.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import SwiftUI

// MARK: - Button Component

struct ButtonComponent: View {
    let title: String
    let bgColor: String
    let fontColor: CustomFontColor

    internal init(
        title: String,
        bgColor: String = StaticColor.yellowLabel,
        fontColor: CustomFontColor = .accent
    ) {
        self.title = title
        self.bgColor = bgColor
        self.fontColor = fontColor
    }

    var body: some View {
        // solid button
        TextComponent(
            text: title,
            fontWeight: .semibold,
            fontSize: 14,
            fontColor: fontColor
        )
        .frame(maxWidth: .infinity, minHeight: 60)
        .background(Color(bgColor), in: RoundedRectangle(cornerRadius: 8))
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(title: "Continue")
            .padding()
    }
}
