//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Goncalves Higino on 13/09/23.
//

import SwiftUI

struct StoresContainerView: View {
    
    var title = "Lojas"
    @State private var ratingFilter = 0;
    
    @State private var minDistanceFilter: Double = 0
    @State private var maxDistanceFilter: Double = 30
    
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter && (store.distance >= minDistanceFilter && store.distance < maxDistanceFilter)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Estrela") {
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
               
                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                        }
                    }
                }
                .foregroundColor(.black)
                
                
                Menu("Distancia") {
                    
                    Button {
                        minDistanceFilter = 0
                        maxDistanceFilter = 30
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
               
                    ForEach(Array(stride(from:0, through: 25, by: 5)), id: \.self) { distance in
                        Button {
                            minDistanceFilter = Double(distance)
                            maxDistanceFilter = Double(distance + 5)
                        } label: {
                            Text("De \(distance) até \(distance + 5) km")
                        }
                    }
                }
                .foregroundColor(.black)
            }
            
          
            
            VStack(alignment: .leading, spacing: 30) {
                
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                    
                }
            }
            .foregroundColor(.black)
            
        }
        .padding(.horizontal, 20)
    }
}

struct StoresContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StoresContainerView()
            .previewLayout(.sizeThatFits)
    }
}
