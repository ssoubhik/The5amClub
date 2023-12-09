//
//  ReserveView.swift
//  The5amClub
//
//  Created by Rhymetech on 26/12/22.
//

import SwiftUI

struct ReserveView: View {
    @Binding var showBottomSheet: Bool
    @Binding var reserveState: ReserveState
    let place: Place?
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                TextComponent(
                    text: place?.placemark.name ?? "",
                    fontWeight: .medium,
                    lineLimit: 1
                )

                TextComponent(
                    text: "\(place?.placemark.thoroughfare ?? ""), \(place?.placemark.locality ?? "")",
                    fontSize: 12,
                    fontColor: .greyText,
                    lineLimit: 1
                )

                HStack {
                    Image(StaticImage.the5amclub)

                    TextComponent(
                        text: "(view charges)",
                        fontWeight: .light,
                        lineLimit: 1
                    )
                    .offset(y: -3)
                }

                // scan button
                ScanButton {
                    withAnimation {
                        reserveState = .nearbyHubs
                    }
                }

                TextComponent(
                    text: "2 Hubs found nearby",
                    fontWeight: .light,
                    lineLimit: 1
                )
            }
            Spacer()

            Image(StaticImage.smartCycle)
        }
        .padding(20)
    }
}

struct ReserveView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveView(showBottomSheet: .constant(true), reserveState: .constant(.reserve), place: nil)
    }
}

struct ScanButton: View {
    var action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(StaticImage.qrCode)

                TextComponent(
                    text: StaticText.scan,
                    fontWeight: .semibold
                )
            }
            .padding(.horizontal, 18)
            .padding(.vertical)
            .background(Color(StaticColor.yellowLabel), in: RoundedRectangle(cornerRadius: 6))
        }
    }
}
