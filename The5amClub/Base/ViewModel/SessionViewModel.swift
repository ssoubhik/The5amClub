//
//  ViewModel.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import Foundation

final class SessionViewModelImpl: ObservableObject {
    @Published var currentTab = Tabs.reserve
    @Published var hamburgerControls = HamburgerControls.new
}
