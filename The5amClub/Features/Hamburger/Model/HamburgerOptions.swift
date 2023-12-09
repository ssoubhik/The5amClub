//
//  HamburgerOptions.swift
//  The5amClub
//
//  Created by Rhymetech on 26/12/22.
//

import Foundation

struct HamburgerOptions: Identifiable {
    let id = UUID()
    let icon: String
    let title: String

    static let option1 = HamburgerOptions(
        icon: "menu-ride-history",
        title: "Rides History"
    )
    static let option2 = HamburgerOptions(
        icon: "menu-refer",
        title: "Refer and Earn"
    )
    static let option3 = HamburgerOptions(
        icon: "menu-wallet",
        title: "Wallet"
    )
    static let option4 = HamburgerOptions(
        icon: "menu-my-rides",
        title: "My Rides"
    )
    static let option5 = HamburgerOptions(
        icon: "menu-settings",
        title: "Settings"
    )
}
