//
//  OnboardingData.swift
//  The5amClub
//
//  Created by Rhymetech on 22/12/22.
//

import SwiftUI

struct OnboardingData: Identifiable {
    let id = UUID()
    let image: String
    let title: String

    static let welcome1 = OnboardingData(
        image: "rider",
        title: "Book Rides"
    )
    static let welcome2 = OnboardingData(
        image: "shop",
        title: "Shop Accessories"
    )
    static let welcome3 = OnboardingData(
        image: "health-monitor",
        title: "Health Monitor"
    )
}
