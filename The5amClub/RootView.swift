//
//  RootView.swift
//  The5amClub
//
//  Created by Rhymetech on 21/12/22.
//

import SwiftUI

struct RootView: View {
    @AppStorage(StorageKeys.isLoggedIn) var isLoggedIn = false
    var body: some View {
        if isLoggedIn {
            DashboardView()
        } else {
            OnboardingPaginationView()
        }
    }
}
