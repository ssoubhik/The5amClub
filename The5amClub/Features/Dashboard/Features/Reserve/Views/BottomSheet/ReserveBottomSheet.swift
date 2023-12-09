//
//  ReserveBottomSheet.swift
//  The5amClub
//
//  Created by Rhymetech on 26/12/22.
//

import SwiftUI

// MARK: - Reserve States

enum ReserveState {
    case reserve
    case nearbyHubs
    case destination
    case tripStart
}

// MARK: - Reserve Bottom Sheet View

struct ReserveBottomSheet: View {
    @Binding var showBottomSheet: Bool
    @State private var reserveState: ReserveState = .reserve
    let place: Place?
    var body: some View {
        ZStack {
            switch reserveState {
            case .reserve:
                ReserveView(
                    showBottomSheet: $showBottomSheet,
                    reserveState: $reserveState,
                    place: place
                )
            case .nearbyHubs:
                NearbyHubsView(
                    showBottomSheet: $showBottomSheet,
                    reserveState: $reserveState,
                    place: place
                )
            case .destination:
                EmptyView()
            case .tripStart:
                EmptyView()
            }
        }
        .background()
        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
        .animation(.easeIn, value: showBottomSheet)
    }
}
