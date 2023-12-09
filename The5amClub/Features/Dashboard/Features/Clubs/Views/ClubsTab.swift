//
//  ClubsTab.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI

// MARK: - Clubs Tab View

struct ClubsTab: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // clubs tab background image
                    ZStack {
                        Image(StaticImage.clubsBg)
                            .resizable()
                            .scaledToFit()
                        
                        Image(StaticImage.the5amclubLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: proxy.size.width * 0.5)
                    }
                    
                    // my clubs header
                    ClubsHeader(
                        header: StaticText.myClubs,
                        value: "2"
                    )
                    
                    // my clubs list
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0...1, id: \.self) { _ in
                                // my clubs row
                                MyClubsRow()
                            }
                        }
                        .padding()
                    }
                    
                    // nearby popular clubs header
                    ClubsHeader(
                        header: StaticText.popularNearYou,
                        value: "13"
                    )
                    
                    // near by clubs list
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0...12, id: \.self) { _ in
                                // my clubs row
                                NearbyClubsRow()
                            }
                        }
                        .padding()
                    }
                    
                    // view all clubs
                    ClubsHeader(
                        header: StaticText.viewAllClubs,
                        showNavigationIndicator: true
                    )
                    .padding(.top, 8)
                    
                    // view all clubs
                    ClubsHeader(
                        header: StaticText.viewClubsActivity,
                        showNavigationIndicator: true
                    )
                    .padding(.top, 20)
                }
            }
            .ignoresSafeArea()
            .navigationTitle("")
            .navigationBarHidden(true)

        }
    }
}

// MARK: - My Clubs Row

struct MyClubsRow: View {
    var body: some View {
        VStack(spacing: 0) {
            // club's display image
            Image("clubs-dummy-dp")
            
            // club's name
            TextComponent(
                text: "Cyclopes",
                fontWeight: .medium,
                fontSize: 13,
                fontColor: .black
            )
        }
    }
}

// MARK: - Nearby Clubs Row

struct NearbyClubsRow: View {
    var body: some View {
        ZStack {
            Image("clubs-dummy-cover")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 120)
                .clipped()

            VStack {
                Spacer()
                
                VStack(spacing: 0) {
                    Image("clubs-dummy-dp")
                    
                    TextComponent(text: "Miami Riders", fontWeight: .medium, fontSize: 13)
                        .offset(y: -8)
                    
                    TextComponent(text: "5,000 Riders", fontWeight: .light, fontSize: 12)
                        .offset(y: -6)
                }
                .frame(maxWidth: .infinity)
                .background(Color(StaticColor.yellowLabel).offset(y: 40))
            }
            .padding(.bottom, 4)
        }
        .cornerRadius(5)

    }
}

// MARK: - Clubs Header View

struct ClubsHeader: View {
    let header: String
    let value: String
    let showNavigationIndicator: Bool
    
    internal init(
        header: String,
        value: String = "",
        showNavigationIndicator: Bool = false
    ) {
        self.header = header
        self.value = value
        self.showNavigationIndicator = showNavigationIndicator
    }
    
    var body: some View {
        HStack {
            // header text
            TextComponent(
                text: header,
                fontWeight: .semibold,
                fontSize: 12
            )
            
            Spacer()
            
            // header value
            if showNavigationIndicator {
                Image(systemName: StaticImage.chevronRight)
            } else {
                TextComponent(
                    text: value,
                    fontWeight: .semibold,
                    fontSize: 13
                )
            }
        }
        .padding()
        .background(Color(StaticColor.silver))
    }
}

struct ClubsTab_Previews: PreviewProvider {
    static var previews: some View {
        ClubsTab()
    }
}
