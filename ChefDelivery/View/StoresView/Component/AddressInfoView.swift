//
//  AddressInfoView.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 14/09/23.
//

import SwiftUI

struct AddressInfoView: View {
    
    let store: StoreType
    
    var body: some View {
        
        HStack {
            Text(store.location)
            Spacer()
            // id: \.self - serve para identificar cada elemento no intervalo de valores
            ForEach(1...store.stars, id: \.self) {_ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

struct AddressInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AddressInfoView(store: storesMock[0])
    }
}
