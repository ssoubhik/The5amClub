//
//  SearchResultView.swift
//  The5amClub
//
//  Created by Rhymetech on 24/12/22.
//

import SwiftUI

struct SearchResultView: View {
    let place: Place
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                TextComponent(text: place.placemark.name ?? "", fontWeight: .semibold)

                HStack(spacing: 0) {
                    TextComponent(text: "5.0", fontSize: 12, fontColor: .greyText)
                        .padding(.trailing, 4)
                    ForEach(0...4, id: \.self) { _ in
                        Image(systemName: StaticImage.star)
                            .font(.system(size: 8))
                            .offset(y: -0.5)
                            .foregroundColor(.yellow)
                    }

                    TextComponent(text: "(261)", fontSize: 12, fontColor: .greyText)
                        .padding(.leading, 6)
                }

                TextComponent(text: "\(place.placemark.thoroughfare ?? ""), \(place.placemark.locality ?? "")", fontSize: 12, fontColor: .greyText)

                HStack(spacing: 0) {
                    TextComponent(text: "Open ", fontSize: 12, fontColor: .greyText)

                    Circle()
                        .fill(Color(StaticColor.greyText))
                        .frame(width: 2, height: 2)

                    TextComponent(text: " Closes 6:30 PM", fontSize: 12, fontColor: .greyText)

                }
            }

            Spacer()

            Image("demo_location")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding()
    }
}
