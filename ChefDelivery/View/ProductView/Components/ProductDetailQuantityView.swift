//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 14/09/23.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    

    @Binding var productQuatity: Int
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                
                Button {
                    if productQuatity > 1 {
                        productQuatity -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                }
                
                Text("\(productQuatity)")
                    .font(.title2)
                    .bold()
                
                Button {
                    productQuatity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                }
                
                
            }
        }
    }
}

struct ProductDetailQuantityView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailQuantityView(productQuatity:.constant(1))
            .previewLayout(.sizeThatFits)
    }
}
