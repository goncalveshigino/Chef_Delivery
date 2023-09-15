//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 13/09/23.
//

import Foundation


struct StoreType: Identifiable, Decodable {

    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let distance: Double
    let products: [ProductType]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, location, stars, distance, products
        case logoImage = "logo_image"
        case headerImage = "header_image"
    }
}


