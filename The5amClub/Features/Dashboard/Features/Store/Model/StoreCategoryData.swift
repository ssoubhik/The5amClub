//
//  StoreCategoryData.swift
//  The5amClub
//
//  Created by Soubhik Sarkhel on 20/01/23.
//

import Foundation

// MARK: - Store Category Data Model

struct StoreCategoryData: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    
    static let category1: StoreCategoryData = StoreCategoryData(
        name: "Cycle\nHelmets",
        image: "store-helmet"
    )
    static let category2: StoreCategoryData = StoreCategoryData(
        name: "Cycle\nBottle",
        image: "store-bottle"
    )
    static let category3: StoreCategoryData = StoreCategoryData(
        name: "Cycle\nLights",
        image: "store-light"
    )
    static let category4: StoreCategoryData = StoreCategoryData(
        name: "Cycle GPS,\nSpeedometer",
        image: "store-gps"
    )
    static let category5: StoreCategoryData = StoreCategoryData(
        name: "Hydration\nBackpacks",
        image: "store-backpack"
    )
}
