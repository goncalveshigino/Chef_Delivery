//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 13/09/23.
//

import Foundation


struct StoreType: Identifiable {

    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let distance: Double
    let products: [ProductType]
}



