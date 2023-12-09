//
//  TabBar.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI

// MARK: - Tab Bar View

struct TabBar: View {
    var body: some View {
        HStack(spacing: 0) {
            // home
            TabBarButton(
                tab: .home,
                tabIcon: StaticImage.home,
                tabTitle: StaticText.home
            )

            // store
            TabBarButton(
                tab: .store,
                tabIcon: StaticImage.store,
                tabTitle: StaticText.store
            )

            // reserve
            TabBarButton(
                tab: .reserve,
                tabIcon: StaticImage.reserve,
                tabTitle: StaticText.reserve
            )

            // clubs
            TabBarButton(
                tab: .clubs,
                tabIcon: StaticImage.clubs,
                tabTitle: StaticText.clubs
            )

            // profile
            TabBarButton(
                tab: .profile,
                tabIcon: StaticImage.profile,
                tabTitle: StaticText.profile
            )
        }
        .padding(.vertical, 10)
        .background(Color(StaticColor.black))
    }
}

// MARK: - Tab Bar Button View

struct TabBarButton: View {
    @EnvironmentObject private var sessionVM: SessionViewModelImpl
    let tab: Tabs
    let tabIcon: String
    let tabTitle: String
    var body: some View {
        Button {
            withAnimation(.spring()) {
                sessionVM.currentTab = tab
            }
        } label: {
            VStack {
                if sessionVM.currentTab == tab {
                    // selected tabicon
                    Image(tabIcon)
                        .renderingMode(.template)
                        .foregroundColor(Color(StaticColor.yellowHighlight))
                } else {
                    // default tab icon
                    Image(tabIcon)
                }

                // title
                TextComponent(
                    text: tabTitle,
                    fontSize: 12,
                    fontColor: sessionVM.currentTab == tab ? .yellowHighlight : .white
                )
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.white
            TabBar()
                .environmentObject(SessionViewModelImpl())
        }
    }
}
