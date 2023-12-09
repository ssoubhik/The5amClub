//
//  NearbyHubsView.swift
//  The5amClub
//
//  Created by Rhymetech on 26/12/22.
//

import SwiftUI

struct NearbyHubsView: View {
    @Binding var showBottomSheet: Bool
    @Binding var reserveState: ReserveState
    let place: Place?
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0...2, id: \.self) { _ in
                        HubsCell()
                    }
                }
                .padding(20)
            }

            // scan button
            ScanButton {
                withAnimation {
                    reserveState = .nearbyHubs
                }
            }
        }
        .padding(.bottom, 20)
    }
}

struct NearbyHubsView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyHubsView(showBottomSheet: .constant(true), reserveState: .constant(.reserve), place: nil)

    }
}

struct HubsCell: View {
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                Image(StaticImage.mapMarker)

                TextComponent(text: "3 Ebike", fontSize: 12)
            }

            VStack(alignment: .leading) {
                TextComponent(text: "Hub1", fontWeight: .semibold)

                TextComponent(text: "Ebike Booking Zone", fontSize: 12, fontColor: .greyText)
            }
            .offset(y: -8)

            Spacer(minLength: 50)

            VStack(spacing: 3) {
                Image(StaticImage.navigation)

                TextComponent(text: "1.1 Km", fontSize: 12)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 10)
            .background(Color(StaticColor.yellowHighlight), in: RoundedRectangle(cornerRadius: 5))
        }
        .padding(12)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .fill(.white)
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 1)
        }
    }
}
