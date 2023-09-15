//
//  ProductDetailview.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 14/09/23.
//

import SwiftUI

struct ProductDetailview: View {
    
    let product: ProductType
    @State private var productQuatity = 1
 
    
    var service = HomeService()
 
    var body: some View {
      
        VStack {
            
            ProductDetailHeaderView(product: product)
        
             Spacer()
            
            ProductDetailQuantityView(productQuatity: $productQuatity)
            
            Spacer()
            
            ProductDetailButtonView {
                Task {
                    await confirmOrder()
                }
            }
        }
    }
    
    func confirmOrder() async {
        do {
            let result = try await service.confirmOrder(product: product)
            
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ProductDetailview_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailview(product: storesMock[0].products[0])
    }
}

struct ProductDetailButtonView: View {
    
    var onButtonPress: () -> Void
    
    var body: some View {
        Button {
            onButtonPress()
        } label: {
            HStack {
                Image(systemName: "cart")
                
                Text("Enviar pedido")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(35)
            .shadow(
                color: Color("ColorRedDark").opacity(0.5),
                radius: 10, x: 6, y:8
            )
        }
    }
}
