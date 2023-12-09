//
//  BestSellingList.swift
//  The5amClub
//
//  Created by Soubhik Sarkhel on 20/01/23.
//

import SwiftUI

// MARK: - Products List View

struct BestSellingList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0...2, id: \.self) { _ in
                    // best selling products column
                    PrdouctsColumn(
                        image: "dummy-product",
                        name: "Cycle Water Bottle Mobility 100 750ml - Red Cycle Water Bottle Mobility 100 750ml - Red",
                        manufacturer: "Btwin",
                        price: "$199"
                    )
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}

struct BestSellingList_Previews: PreviewProvider {
    static var previews: some View {
        BestSellingList()
    }
}
