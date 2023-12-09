//
//  The5amClubApp.swift
//  The5amClub
//
//  Created by Rhymetech on 21/12/22.
//

import SwiftUI

@main
struct The5amClubApp: App {
    @StateObject private var sessionVM = SessionViewModelImpl()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(sessionVM)
        }
    }
}
