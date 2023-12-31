//
//  HamburgerControls.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import Foundation

// MARK: - Hamburger Menu Controls Model

struct HamburgerControls {
    var showHamburgerMenu: Bool
    var isHamburgerNavigationActive: Bool
    var hamburgerNavigationTitle: String
}

// MARK: - Hamburger Menu Controls Model Extension

extension HamburgerControls {
    static var new: HamburgerControls {
        HamburgerControls(
            showHamburgerMenu: false,
            isHamburgerNavigationActive: false,
            hamburgerNavigationTitle: ""
        )
    }
}
