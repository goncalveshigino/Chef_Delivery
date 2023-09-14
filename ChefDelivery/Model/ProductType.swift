//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 13/09/23.
//

import Foundation


struct ProductType: Identifiable {
    
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return price.formatPrice() + "kz"
    }
}
