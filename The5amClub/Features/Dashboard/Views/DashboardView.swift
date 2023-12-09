//
//  DashboardView.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI

// MARK: - Tabs

enum Tabs: String {
    case home
    case store
    case reserve
    case clubs
    case profile
}

// MARK: - Dashboard View

struct DashboardView: View {
    @EnvironmentObject private var sessionVM: SessionViewModelImpl

    init() {
        // hide default tab bar
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $sessionVM.currentTab) {
                    // home tab
                    HomeTab()
                        .tag(Tabs.home)

                    // store tab
                    StoreTab()
                        .tag(Tabs.store)

                    // reserve tab
                    ReserveTab()
                        .tag(Tabs.reserve)

                    // clubs tab
                    ClubsTab()
                        .tag(Tabs.clubs)

                    // profile tab
                    ProfileTab()
                        .tag(Tabs.profile)
                }

                // custom tab bar
                TabBar()

                // navigate to hamburger details screen
                NavigationLink(isActive: $sessionVM.hamburgerControls.isHamburgerNavigationActive) {
                    EmptyView()
                } label: {
                    EmptyView()
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .slideInView(isActive: $sessionVM.hamburgerControls.showHamburgerMenu, options: .init(paddingColorOpacity: 0.5, shouldDismissUponSwipe: true)) {
            // hamburger view
            HamburgerView()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(SessionViewModelImpl())
    }
}
