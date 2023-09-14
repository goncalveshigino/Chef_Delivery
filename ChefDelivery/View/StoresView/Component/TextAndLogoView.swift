//
//  TextAndLogoView.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 14/09/23.
//

import SwiftUI

struct TextAndLogoView: View {
    
    let store: StoreType
    
    var body: some View {
       
        HStack {
            Text(store.name)
                .font(.title)
                .bold()
            
            Spacer()
            
            Image(store.logoImage)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

struct TextAndLogoView_Previews: PreviewProvider {
    static var previews: some View {
        TextAndLogoView(store: storesMock[0])
    }
}
