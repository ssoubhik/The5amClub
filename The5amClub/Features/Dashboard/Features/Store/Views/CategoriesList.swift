//
//  CategoriesList.swift
//  The5amClub
//
//  Created by Soubhik Sarkhel on 20/01/23.
//

import SwiftUI

// MARK: - Categories List View

struct CategoriesList: View {
    let categories: [StoreCategoryData] = [
        .category1,
        .category2,
        .category3,
        .category4,
        .category5
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                ForEach(categories) { category in
                    // categories column view
                    CategoriesColumn(category: category)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}

// MARK: - Categories Column View

struct CategoriesColumn: View {
    let category: StoreCategoryData
    var body: some View {
        VStack {
            // category image
            Image(category.image)
                .padding(8)
                .background {
                    Circle()
                        .fill(.white)
                        .overlay {
                            Circle()
                                .stroke(Color(StaticColor.greyText).opacity(0.3), lineWidth: 1)
                        }
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 1, y: 1)
                }
            
            // category name
            TextComponent(
                text: category.name,
                fontWeight: .medium,
                fontSize: 12,
                alignment: .center
            )
        }
    }
}

struct CategoriesColumn_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList()
    }
}
