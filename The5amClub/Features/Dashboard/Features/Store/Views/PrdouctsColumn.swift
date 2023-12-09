//
//  PrdouctsColumn.swift
//  The5amClub
//
//  Created by Soubhik Sarkhel on 20/01/23.
//

import SwiftUI

// MARK: - Prdoucts Column View

struct PrdouctsColumn: View {
    let image: String
    let name: String
    let manufacturer: String
    let price: String
    var body: some View {
        VStack(alignment: .leading) {
            // product image
            Image(image)
                .offset(x: -7)

            // product name
            TextComponent(
                text: name,
                fontSize: 16,
                fontColor: .black,
                lineLimit: 1
            )
            .frame(maxWidth: 180, alignment: .leading)
            
            // product manufacturer
            TextComponent(
                text: manufacturer,
                fontSize: 12,
                fontColor: .greyText
            )
            
            // product price
            TextComponent(
                text: price,
                fontWeight: .medium,
                fontSize: 16
            )
        }
    }
}
