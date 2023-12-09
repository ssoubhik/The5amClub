//
//  StoreTab.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI

struct StoreTab: View {
    @State private var searchText = ""
    var body: some View {
        VStack(spacing: 0) {
            SearchBar(searchText: $searchText)
                .padding()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    // categories section
                    TextComponent(
                        text: "Categories",
                        fontWeight: .bold,
                        fontSize: 18
                    )
                    .padding(.leading)
                    
                    // categories list
                    CategoriesList()
                    
                    // best selling section
                    HStack {
                        // section header
                        TextComponent(
                            text: "Best Selling",
                            fontWeight: .bold,
                            fontSize: 18
                        )
                        
                        Spacer()
                        
                        // see all button
                        TextComponent(
                            text: "See all",
                            fontSize: 15
                        )
                    }
                    .padding([.horizontal, .top])
                    
                    // best selling list
                    BestSellingList()
                    
                    // promotional banner
                    Image("dummy-promo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                    // featured brands section
                    TextComponent(
                        text: "Featured Brands",
                        fontWeight: .bold,
                        fontSize: 18
                    )
                    .padding(.leading)
                    
                    // featured brands list
                    FeaturedBrandsList()
                    
                    // recommended section
                    HStack {
                        // section header
                        TextComponent(
                            text: "Recommended",
                            fontWeight: .bold,
                            fontSize: 18
                        )
                        
                        Spacer()
                        
                        // see all button
                        TextComponent(
                            text: "See all",
                            fontSize: 15
                        )
                    }
                    .padding([.horizontal, .top])
                    
                    // recommended products list
                    RecommendedList()
                }
                .padding(.bottom)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct StoreTab_Previews: PreviewProvider {
    static var previews: some View {
        StoreTab()
    }
}
