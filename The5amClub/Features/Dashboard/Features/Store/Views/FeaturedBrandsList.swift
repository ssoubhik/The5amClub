//
//  FeaturedBrandsList.swift
//  The5amClub
//
//  Created by Soubhik Sarkhel on 20/01/23.
//

import SwiftUI

// MARK: - Featured Brands List View

struct FeaturedBrandsList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                ForEach(0...1, id: \.self) { _ in
                    FeaturedBrandsColumn()
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}

// MARK: - Featured Brands Column

struct FeaturedBrandsColumn: View {
    var body: some View {
        HStack(spacing: 16) {
            Image("dummy-beats")
            
            VStack(alignment: .leading) {
                TextComponent(
                    text: "Beats",
                    fontWeight: .bold,
                    fontSize: 16
                )
                
                TextComponent(
                    text: "5693 Products",
                    fontSize: 12,
                    fontColor: .greyText
                )
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 4)
                .fill(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(StaticColor.greyText).opacity(0.02), lineWidth: 1)
                }
                .shadow(color: Color.black.opacity(0.08), radius: 4, x: 1, y: 3)
        }
    }
}

struct FeaturedBrandsList_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedBrandsList()
    }
}
