//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 13/09/23.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    @Environment(\.presentationMode) var PresentationMode
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading ) {
                
                Image(store.headerImage)
                    .resizable()
                    .scaledToFit()
                
                TextAndLogoView(store: store)
                
                AddressInfoView(store: store)
                
                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
                ForEach(store.products) { product in
                    
                    Button {
                        selectedProduct = product
                    } label: {
                        
                        CardInfoProductView(product: product)
                    }
                    .sheet(item: $selectedProduct) { product in
                        ProductDetailview(product: product)
                    }
                   
                    
                }
            }
            .navigationTitle(store.name)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading ) {
                    Button {
                        PresentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "cart")
                            
                            Text("Lojas")
                        }
                        .foregroundColor(Color("ColorRed"))
                    }
                }
            }
        }
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: storesMock[0])
    }
}
