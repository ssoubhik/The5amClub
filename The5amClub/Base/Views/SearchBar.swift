//
//  SearchBar.swift
//  The5amClub
//
//  Created by Soubhik Sarkhel on 20/01/23.
//

import SwiftUI

// MARK: - Search Bar View

struct SearchBar: View {
    @EnvironmentObject var sessionVM: SessionViewModelImpl
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            // menu button
            Button {
                sessionVM.hamburgerControls.showHamburgerMenu = true
            } label: {
                Image(systemName: StaticImage.bulletList)
            }
            
            // divider
            Rectangle()
                .fill(Color(StaticColor.greyText))
                .frame(maxWidth: 1, maxHeight: 28)
            
            // magnifying glass icon
            Image(systemName: StaticImage.glass)
            
            // search textfield
            TextField(StaticText.enterDestination, text: $searchText)
            
            // divider
            Rectangle()
                .fill(Color(StaticColor.greyText))
                .frame(maxWidth: 1, maxHeight: 28)
            
            // favourites button
            Button {
                // action
            } label: {
                Image(systemName: StaticImage.star)
            }
            
        }
        .font(.custom(StaticFont.light, size: 14))
        .foregroundColor(Color(StaticColor.greyText))
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .fill(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(StaticColor.greyText).opacity(0.3), lineWidth: 1)
                }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
            .environmentObject(SessionViewModelImpl())
    }
}
