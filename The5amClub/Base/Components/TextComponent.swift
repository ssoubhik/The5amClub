//
//  TextComponent.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import SwiftUI

// MARK: - Custom Font Weights

enum CustomFontWeight: String {
    case black = "MartianBThai-Black"
    case bold = "MartianBThai-Bold"
    case semibold = "MartianBThai-SemiBold"
    case medium = "MartianBThai-Medium"
    case regular = "MartianBThai-Regular"
    case light = "MartianBThai-Light"
}

// MARK: - Custom Font Colors

enum CustomFontColor: String {
    case accent = "AccentColor"
    case greyText = "grey-text"
    case yellowHighlight = "yellow-highlight"
    case white, black
}

// MARK: - Text Component

struct TextComponent: View {
    let text: String
    let fontWeight: CustomFontWeight
    let fontSize: CGFloat
    let fontColor: CustomFontColor
    let alignment: TextAlignment
    let fixedSize: Bool
    let lineLimit: Int

    internal init(
        text: String,
        fontWeight: CustomFontWeight = .regular,
        fontSize: CGFloat = 14,
        fontColor: CustomFontColor = .accent,
        alignment: TextAlignment = .leading,
        fixedSize: Bool = false,
        lineLimit: Int = 0
    ) {
        self.text = text
        self.fontWeight = fontWeight
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.alignment = alignment
        self.fixedSize = fixedSize
        self.lineLimit = lineLimit
    }

    var body: some View {
        if lineLimit > 0 {
            Text(text)
                .font(.custom(fontWeight.rawValue, size: fontSize))
                .foregroundColor(Color(fontColor.rawValue))
                .multilineTextAlignment(alignment)
                .fixedSize(horizontal: false, vertical: fixedSize)
                .lineLimit(lineLimit)
        } else {
            Text(text)
                .font(.custom(fontWeight.rawValue, size: fontSize))
                .foregroundColor(Color(fontColor.rawValue))
                .multilineTextAlignment(alignment)
                .fixedSize(horizontal: false, vertical: fixedSize)
        }
    }
}
