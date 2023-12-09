//
//  RecommendedList.swift
//  The5amClub
//
//  Created by Soubhik Sarkhel on 20/01/23.
//

import SwiftUI

// MARK: - Recommended List View

struct RecommendedList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0...2, id: \.self) { _ in
                    // recommended products column
                    PrdouctsColumn(
                        image: "dummy-product-2",
                        name: "Mountain Bike Helmet ST 500 - Yellow Mountain Bike Helmet ST 500 - Yellow",
                        manufacturer: "ROCKRIDER",
                        price: "$2,199"
                    )
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}

struct RecommendedList_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedList()
    }
}
